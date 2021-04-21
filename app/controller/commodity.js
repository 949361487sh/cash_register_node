// 商品相关
'use strict';
const BaseController = require('./base')
const fs = require('fs')
const { resolve, join } = require('path')
class CommodityController extends BaseController {
	async getType() {
		const {
			ctx
		} = this;
		const payload = ctx.request.body || {}
		console.log(payload)
		const data = await this.app.mysql.query("select * from commodityType");
		if (data) {
			this.success(data)
		} else {
			this.error('获取分类失败')
		}
	}
	// 获取库存
	async getStock() {
		const {
			ctx
		} = this;
		const { pageSize, pageNo } = ctx.request.body || {}
		console.log(pageSize, pageNo, '获取到的分页');
		const data = await this.app.mysql.query(`select * from stock ORDER BY id DESC LIMIT ${(pageNo - 1) * 10},${pageSize} `);
		const total = await this.app.mysql.query(`select count(*) as number from stock`);
		if (data) {
			this.success(data, total[0].number)
		} else {
			this.error('获取库存失败')
		}
	}
	// 删除
	async delStock() {
		const {
			ctx
		} = this;
		const { id, isDelete } = ctx.request.body || {}
		try {
			await this.app.mysql.update('stock', { id, isDelete });
			this.message('删除成功')
		} catch (error) {
			this.error('删除失败')
		}
	}
	// 新增 商品分类，品牌，单位
	async addType() {
		const {
			ctx
		} = this;
		const {
			type,
			className
		} = ctx.request.body || {}
		const data = await this.app.mysql.insert('commodityType', {
			type,
			className
		});
		if (data) {
			this.message('新增成功')
		} else {
			this.error('新增失败')
		}
	}
	// 新增订单
	async newOrders() {
		const {
			ctx
		} = this;
		const {
			addReceivablePic,
			receiptsPic,
			giveChange,
			orderNumber,
			discount,
			allPic,
			commodityIds,
			memberName
		} = ctx.request.body || {}
		const data = await this.app.mysql.insert('neworders', {
			addReceivablePic,
			receiptsPic,
			giveChange,
			createTime: new Date(),
			orderNumber,
			discount,
			allPic,
			commodityIds,
			memberName
		});
		if (data) {
			const getData = await this.app.mysql.select('neworders', { where: { orderNumber } })
			console.log(getData, 'getData数据');
			let purchase = commodityIds.split(',')
			console.log(purchase, 'purchase的数据');
			purchase.forEach(async item => {
				await this.app.mysql.insert(
					'purchase', { newworderId: getData[0].id, stockId: item }
				);

			});


			this.success(getData)
		} else {
			this.error('交易失败')
		}
	}
	// 搜索商品
	async searchStock() {
		const {
			ctx
		} = this;
		// 库存搜索
		const { commodityTitle, termOfValidityEnd, termOfValidityStart, isDelete, pageSize, pageNo } = ctx.request.body || {}
		const isDeleteSql = isDelete == '2' ? '' : `isDelete = ${isDelete} and `
		let sql = `select * from stock where ${isDeleteSql} commodityTitle like '%${commodityTitle}%' and (termOfValidity <= ${termOfValidityEnd} and termOfValidity >= ${termOfValidityStart}) ORDER BY id DESC LIMIT ${(pageNo - 1) * 10},${pageSize}  `
		let getCont = `select * from stock where ${isDeleteSql} commodityTitle like '%${commodityTitle}%' and (termOfValidity <= ${termOfValidityEnd} and termOfValidity >= ${termOfValidityStart})`
		console.log(sql, '执行sql');
		const data = await this.app.mysql.query(sql);
		const getContData = await this.app.mysql.query(getCont);
		console.log(getContData.length, '获取的长度');
		if (data) {
			this.success(data, getContData.length)
		} else {
			this.error('查询失败')
		}
	}
	// 根据订单查询商品列表
	async searchOderNumberStock() {
		const {
			ctx
		} = this;
		// 库存搜索
		const { id } = ctx.request.body || {}
		const getStock = `SELECT * FROM stock WHERE id IN (SELECT stockId FROM purchase WHERE newworderId=${id})`
		console.log(getStock, '：getStock---sql');
		const data = await this.app.mysql.query(getStock);
		console.log(data.length, '获取的长度');
		if (data) {
			this.success(data, data.length)
		} else {
			this.error('查询失败')
		}
	}
	// 订单查询
	async searchOderNumber() {
		const {
			ctx
		} = this;
		// 库存搜索
		const { orderNumber, timeStart, timeEnd, memberName } = ctx.request.body || {}
		let time = '', member = '';
		if (timeStart != '') {
			time = `and createTime >= '${timeStart} 00:00:00' and createTime <= '${timeEnd} 23:59:59'`
		}
		if (memberName != '') {
			member = `and memberName like '%${memberName}%'`
		}
		const sql = `select * from neworders where orderNumber like '%${orderNumber}%' ${member} ${time} ORDER BY id DESC`
		const orderNumberSql = await this.app.mysql.query(sql);
		console.log(sql, '==============orderNumberSql');
		if (orderNumberSql) {
			this.success(orderNumberSql, orderNumberSql.length)
		} else {
			this.error('查询失败')
		}
	}
	// 首页查询
	async searchStockAdd() {
		const {
			ctx
		} = this;
		// 首页查询
		const { commodityTitle, code, isDelete } = ctx.request.body || {}
		let sql = `select * from stock where (commodityTitle like '%${commodityTitle}%' or code like '%${code}%') and isDelete=${isDelete}`
		console.log(sql, '执行sql');
		const data = await this.app.mysql.query(sql);
		if (data) {
			this.success(data)
		} else {
			this.error('查询失败')
		}
	}
	// 新增库存	
	async addCommodity() {
		const {
			ctx
		} = this;
		const {
			salesMethods,
			code,
			commodityUnit, // 商品单位
			commodityType, // 商品分类
			commodityBrand, // 商品品牌
			commoditySpecifications, // 商品规格
			buyingPrice, // 进货价
			retailPrice, // 零售价
			grossProfitRate, // 毛利率
			stock, // 库存
			termOfValidity, // 有效期
			isDiscount, // 参与折扣
			isIntegral, // 是否积分
			commodityTitle, // 商品名称
			supplier, // 供货商
			memberPic, // 会员价
			remark,
			id
		} = ctx.request.body || {}
		let data = null
		if (id) {
			data = await this.app.mysql.update('stock', {
				id,
				salesMethods,
				code,
				commodityUnit, // 商品单位
				commodityType, // 商品分类
				commodityBrand, // 商品品牌
				commoditySpecifications, // 商品规格
				buyingPrice, // 进货价
				retailPrice, // 零售价
				grossProfitRate, // 毛利率
				stock, // 库存
				termOfValidity, // 有效期
				isDiscount, // 参与折扣
				isIntegral, // 是否积分
				commodityTitle, // 商品名称
				supplier, // 供货商
				memberPic, // 会员价
				remark,
				updateTime: new Date()
			});
		} else {
			data = await this.app.mysql.insert('stock', {
				salesMethods,
				code,
				commodityUnit, // 商品单位
				commodityType, // 商品分类
				commodityBrand, // 商品品牌
				commoditySpecifications, // 商品规格
				buyingPrice, // 进货价
				retailPrice, // 零售价
				grossProfitRate, // 毛利率
				stock, // 库存
				termOfValidity, // 有效期
				isDiscount, // 参与折扣
				isIntegral, // 是否积分
				commodityTitle, // 商品名称
				supplier, // 供货商
				memberPic, // 会员价
				remark,
				createTime: new Date()
			});
		}


		if (data) {
			if (id) {
				this.success({ id })
			} else {
				const data = await this.app.mysql.query("SELECT id FROM stock ORDER BY id DESC LIMIT 0,1");
				this.success(data[0])
			}

		} else {
			this.error('执行失败')
		}
	}
	// 上传商品图片
	async uploadFile() {
		const { ctx } = this;
		let { id } = ctx.request.body
		let files = ctx.request.files[0] // file包含了文件名，文件类型，大小，路径等信息，可以自己打印下看看
		// 读取文件
		console.log(files);
		let fileUrl = join(__dirname, '../public/uploadFile')
		let file = fs.readFileSync(files.filepath) //files[0]表示获取第一个文件，若前端上传多个文件则可以遍历这个数组对象
		// 将文件存到指定位置
		const time = Date.parse(new Date())
		const reName = `${time}_${files.filename.replace(' ', '_')}`
		const _this = this
		await fs.writeFile(`${fileUrl}/${reName}`, file, function (err) {
			if (err) {
				console.log("down fail");
				_this.error('图片上传失败')
				return
			}
		});
		// ctx.cleanupRequestFiles()
		await this.app.mysql.update('stock', { id, imgUrl: `${reName}`, updateTime: new Date() })
		this.message('成功')



	}
}

module.exports = CommodityController;
