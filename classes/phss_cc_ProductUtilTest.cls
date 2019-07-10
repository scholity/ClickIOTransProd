/**
 * Created by dgajwani on 9/24/18.
 */
@isTest
public with sharing class phss_cc_ProductUtilTest {

    private static final String TEST_SEARCH_STRING = 'TEST0';
    public static List<ccrz__E_Product__c> testProducts;
    public static Opportunity testOpportunity;

    /**
     * @description Creates the basic testdata.
     */
    public static void setupTestData() {
        Map<String, Object> testData = phss_cc_TestDataFactory.setupAccountAndProducts();
        testProducts = (List<ccrz__E_Product__c>)testData.get(phss_cc_TestDataFactory.TEST_PRODUCTS);
        testOpportunity = phss_cc_TestDataFactory.createInsertTestOpportunity((Account)testData.get(phss_cc_TestDataFactory.TEST_ACCOUNT));
    }

    @isTest
    public static void testProductSearch(){

        setupTestData();
        Id [] fixedSearchResults= new Id[1];
        fixedSearchResults[0] = testProducts.get(0).Id;

        Test.startTest();
        Test.setFixedSearchResults(fixedSearchResults);
        Map<String, Object> searchResult = phss_cc_ProductUtil.productSearch(testOpportunity.Id,TEST_SEARCH_STRING);

        Test.stopTest();

        System.assertNotEquals(null, searchResult);
        System.assert(searchResult.containsKey(phss_cc_ProductUtil.PRODUCT_LIST_KEY));
        System.assert(searchResult.containsKey(phss_cc_ProductUtil.PRODUCT_MAP_KEY));
        Set<String> productMapFromResult = (Set<String>)searchResult.get(phss_cc_ProductUtil.PRODUCT_LIST_KEY);
        System.assert(productMapFromResult.size() > 0);
    }
}