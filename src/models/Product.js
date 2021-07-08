const db = require('../modules/mysql2-connent')

const sqlSelect = "SELECT `items`.`itemId`, `items`.`itemNo` , `items`.`itemName`, `items`.`itemCoverImg`, `items`.`itemImg`, `items`.`itemPrice`, `items`.`itemQty`, `items`.`itemDescription`, `items`.`itemCategoryId`,  `items_categories`.`categoryName`, `cate2`.`categoryId` AS `categoryIdParent`, `cate2`.`categoryName` AS `categoryNameParent`,`items`.`itemFlowId`,`items_flow`.`flowName` ,`items_flow`.`flowImg` , `items`.`itemSize`, `items`.`itemOptionId`, `items_options`.`optionName`,`items`.`itemRanking`,`items`.`created_at`,`items`.`updated_at` FROM `items` INNER JOIN  `items_categories` ON `items`.`itemCategoryId` = `items_categories`.`categoryId` LEFT JOIN `items_categories` AS `cate2` ON `items_categories`.`categoryParentId` = `cate2`.`categoryId` INNER JOIN `items_flow` ON `items`.`itemFlowId` = `items_flow`.`flowId` INNER JOIN `items_options` ON `items`.`itemOptionId` = `items_options`.`optionId`"

class Product{
    // `itemId`, `itemNo`, `itemName`, `itemCoverImg`, `itemImg`, `itemPrice`, `itemQty`, `itemDescription`, `itemCategoryId`, `itemCategoryChildId`, `itemFlowId`, `itemSize`, `itemOptionId`, `itemTagId`, `itemRanking`,`created_at`, `updated_at`
    constructor(data){
        let defaultData = {
            itemId: null,
            itemNo: '',
            itemName: '',
            itemCoverImg: '',
            itemImg: [],
            itemPrice: 0,
            itemQty: 0,
            itemDescription: '',
            itemCategoryId: 0,
            itemFlowId: 0, 
            itemSize: '',
            itemOptionId: 0,
            itemTagId: '',
            itemRanking: 0
        }

        this.data = {...defaultData, ...data}
    };


    static async getRows(params={}){
        let perPage = params.perPage || 6;  // 每頁有幾筆
        let page = params.page || 1;  // 查看第幾頁
        let cate = parseInt(params.cate) || 0;  // 分類編號
        let flow = parseInt(params.flow) || 0;  // 流量編號
        let keyword = params.keyword || '';  // 搜尋產品名稱或者作者姓名
        let orderBy = params.orderBy || '';  // 排序

        let where = ' WHERE 1 ';
        if(cate){
            where += ' AND itemCategoryId=' + cate;
        }
        if(flow){
            where += ' AND itemFlowId=' + flow;
        }
        if(keyword){
            let k2 = db.escape('%' + keyword + '%');
            where += ` AND (itemName LIKE ${k2} OR itemDescription LIKE ${k2}) `;
        }
        

        let orderStr = '';
        switch(orderBy){
            case 'itemPrice':
            case 'price-asc':
                orderStr = ' ORDER BY `itemPrice` ASC ';
                break;
            case 'price-desc':
                orderStr = ' ORDER BY `itemPrice` DESC ';
                break;
            case 'itemRanking':
            case 'rank-asc':
                orderStr = ' ORDER BY `itemRanking` ASC ';
                break;
            case 'rank-desc':
                orderStr = ' ORDER BY `itemRanking` DESC ';
                break;
        }

        let t_sql = `SELECT COUNT(1) num FROM \`items\` ${where}`;
        let [r1] = await db.query(t_sql);
        let total = r1[0]['num'];

        let r2, totalPages=0;
        if(total){
            totalPages = Math.ceil(total/perPage);
            let r_sql = `SELECT * FROM \`items\` ${where} ${orderStr} LIMIT ${(page-1)*perPage}, ${perPage}`;
            [r2] = await db.query(r_sql);
        }
        return {
            total,
            totalPages,
            perPage,
            page,
            params,
            data: r2,
        }
    }
    
    static async getItems(params={}){
        let results = await Product.getRows(params);
        if(results.data && results.data.length){
            results.data = results.data.map(el=> new Product(el));
        }
        return results;
    }

    
    // 讀取所有
    static async getAllItems(){
        let sql = 
        `${sqlSelect} ORDER BY \`items\`.\`itemId\``;
        let [r] = await db.query(sql);
        if(!r || !r.length){
            return null;
        }
        return r;
    }
    

    
    // 列出父分類
    // static async getCatePaItems(categoryIdParent){
    //     let sql = 
    //     `${sqlSelect} WHERE \`categoryIdParent\`=? ORDER BY \`items\`.\`itemId\``;
    //     let [r] = await db.query(sql,[categoryIdParent]);
    //     if(!r || !r.length){
    //         return null;
    //     }
    //     return r;
    // }
    
    // 列出子分類
    static async getItemByCate(itemCategoryId){
        let sql = 
        `${sqlSelect} WHERE \`itemCategoryId\`=? ORDER BY \`items\`.\`itemId\``;
        let [r] = await db.query(sql,[itemCategoryId]);
        if(!r || !r.length){
            return null;
        }
        return r;
    }
    
    // 讀取單筆
    static async getItemById(itemId){
        if(!itemId) return null;
        let sql = `${sqlSelect} WHERE \`itemId\`=?`;
        let [r] = await db.query(sql, [itemId]);
        if(!r || !r.length){
            return null;
        }
        return r[0];
    }

    static async getItem(itemId) {
        let row = await Product.getRow(itemId);
        return new Product( row );
    }


}


module.exports = Product;
