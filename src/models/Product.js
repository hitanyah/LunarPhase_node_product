const db = require(__dirname + '/../modules/mysql2-connect');


class Product{
    // `itemId`, `itemNo`, `itemName`, `itemCoverImg`, `itemImg`, `itemPrice`, `itemQty`, `itemDescription`, `itemCategoryId`, `itemCategoryChildId`, `itemFlowId`, `itemSize`, `itemOptionId`, `itemTagId`, `itemRanking`
    constructor(data){
        let defaultData = {
            itemId: null,
            itemNo: '',
            itemName: '',
            itemCoverImg: '',
            itemImg: [],
            itemPrice: '',
            itemQty: '',
            itemDescription: '',
            itemCategoryId: '',
            itemCategoryChildId: '',
            itemFlowId: '', 
            itemSize: '',
            itemOptionId: '',
            itemTagId: '',
            itemRanking: ''
        }

        this.data = {...defaultData, ...data}
    };
    static async getRows(params={}){
        let perPage = params.perPage || 6;  // 每頁有幾筆
        let page = params.page || 1;  // 查看第幾頁
        let orderBy = params.orderBy || '';  // 排序
    
    
    
    }
    static async getItems(params={}){
        let results = await Product.getRows(params);
        if(results.data && results.data.length){
            results.data = results.data.map(el=> new Product(el));
        }
        return results;
    }
}



module.exports = Product;
