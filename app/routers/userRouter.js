module.exports = app => {
	const { router, controller } = app;
	router.post('/login', controller.userLogin.login);
	router.post('/getInfo', controller.userLogin.getInfo);
	router.post('/logout', controller.userLogin.logout);


	// 收银扫码

	router.post('/cashRegister/scanCode', controller.userLogin.scanCode);

	// 查询商品分类

	router.post('/commodity/getType', controller.commodity.getType);
	router.post('/commodity/addType', controller.commodity.addType);
	router.post('/commodity/addCommodity', controller.commodity.addCommodity);
	router.post('/commodity/getStock', controller.commodity.getStock);
	router.post('/commodity/searchStock', controller.commodity.searchStock);
	router.post('/commodity/uploadFile', controller.commodity.uploadFile);
	router.post('/commodity/delStock', controller.commodity.delStock);
	router.post('/commodity/searchStockAdd', controller.commodity.searchStockAdd);
	router.post('/cashRegister/getMember', controller.userLogin.getMember);
	router.post('/cashRegister/addMember', controller.userLogin.addMember);
};
