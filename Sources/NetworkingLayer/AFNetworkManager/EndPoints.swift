//
//  File.swift
//  
//
//  Created by Abdul Rehman Amjad on 31/05/2023.
//

import Foundation
import SmilesUtilities

public struct EndPoints {
    // MARK: - BASE URL
    
    public static let baseURL = AppCommonMethods.getConfigurationForCurrentScheme("MAIN_URL")
    public static let logEnabled = AppCommonMethods.getConfigurationForCurrentScheme("IS_NSLOG_ENABELED")
    public static let applicationVersionNubmer = AppCommonMethods.getConfigurationForCurrentScheme("APPLICATION_VERSION")
    public static let isCustumHeaderEnabled = AppCommonMethods.getConfigurationForCurrentScheme("IS_CUSTOM_HEADER_ENABELED")
    public static let isDevModeEnabled = AppCommonMethods.getConfigurationForCurrentScheme("IS_DEV_MODE_ENABELED")
    public static let webServiceEnvironment = AppCommonMethods.getConfigurationForCurrentScheme("WEB_SERVICE_ENRIRONMENT")
    public static let shareUrl = AppCommonMethods.getConfigurationForCurrentScheme("SHARE_URL")
    public static let versionNumber = AppCommonMethods.getConfigurationForCurrentScheme("VERSION_NUMBER")

    
    
    // MARK: - Home EndPoint
    
    public static let homeEndpoint = "home"
    public static let getCountryListEndpoint = "\(homeEndpoint)/get-country-list-v2"
    public static let getNationalitiesEndpoint = "\(homeEndpoint)/get-country-list-v2"
    public static let switchToEtisalat = "\(homeEndpoint)/switch-etisalat-url"
    public static let getUserProfileEndpoint = "\(homeEndpoint)/get-reward-points"
    public static let getHomeShortcutsEndpoint = "\(homeEndpoint)/get-home-shortcuts"
    public static let getHomeItemCategoriesEndpoint = "\(homeEndpoint)/v1/get-home-item-categories"
    public static let getrewardPointsEndpoint = "\(homeEndpoint)/get-reward-points"
    public static let getAdsEndpoint = "\(homeEndpoint)/v1/get-ads"
    public static let getOfferDetailsEndPoint = "\(homeEndpoint)/v1/offer-details"
    public static let getAllPartnersEndPoint = "\(homeEndpoint)/get-partner-list-by-category"
    public static let getPartnerDetailsEndPoint = "\(homeEndpoint)/get-partner-details"
    //get-ads
//    static let getAdsEndpoint = "\(homeEndpoint)/get-ads"
    public static let getOfferCategoriesEndpoint = "\(homeEndpoint)/get-offer-categories"
    public static let getDealsEndpoint = "\(homeEndpoint)/v1/deals-for-you"
    public static let getNearbyOffersEndpoint = "\(homeEndpoint)/get-nearby-offers"
    public static let updateWishlistEndpoint = "\(homeEndpoint)/update-wishlist"
    public static let getTravelOffersEndpoint = "\(homeEndpoint)/get-travel-offers"
    public static let getBecomeAPartnerCategoriesEndpoint = "\(homeEndpoint)/get-partner-offer-categories"
    public static let getInsuranceEndPoint = "\(homeEndpoint)/get-insurance-section"
    public static let getDealOfDayEndPoint = "\(homeEndpoint)/get-deal-of-the-day"
    public static let getSmilesWebViewURLEndPoint = "\(homeEndpoint)/get-travel-partner-url"
    public static let getToolTips = "\(homeEndpoint)/get-tool-tips-details"
    public static let customizeCategories = "\(homeEndpoint)/v1/customize-user-item-categories"
    public static let getSmilesCardEnpoint = "profile/get-virtual-card"
    public static let getSmilesCardPinEnpoint = "profile/v1/get-profile-pin"
    public static let searchVouchers = "\(homeEndpoint)/v1/search-offers"
    public static let getConsentsEndpoint = "\(homeEndpoint)/redirection-consent-config"

    
    public static let emailVerifiedLink = "profile/v1/email-verification-link"
    public static let recommendedSearch = "search/recommended-search"
    
    public static let getOfferCategoriesV1Endpoint = "\(homeEndpoint)/v1/get-offer-categories"
    
    public static let getVoucherListHomeEndpoint = "\(homeEndpoint)/get-vouchers-list"

    public static let getVideoTutorial = "\(homeEndpoint)/v1/get-video-tutorial"
    public static let getOrderRating = "order-review/v1/order-rating"
    public static let getRecommendedOffers = "\(homeEndpoint)/get-recommended-offers"

    // MARK: - Birthday EndPoint
    
    public static let birthdayGiftEndpoint = "birthday-gift"
    public static let fetchBirthdayGiftEndpoint = "\(birthdayGiftEndpoint)/fetch-birthday-gift"
    public static let getBirthdayGiftOffrsEndpoint = "\(birthdayGiftEndpoint)/get-birthday-offers"
    
    // MARK: - Devices EndPoint
    
    public static let deviceEndpoint = "device"
    public static let getLatestDevicesEndpoint = "\(deviceEndpoint)/get-latest-devices"
    
    // MARK: - Login EndPoint
    
    public static let loginEndpoint = "login"
    public static let createOtpEndpoint = "\(loginEndpoint)/send-otp-v1"
    public static let verifyOtpEndpoint = "\(loginEndpoint)/verify-otp"
    public static let fullAccessEndpoint = "\(loginEndpoint)/full-access"
    public static let verifyDOBEndpoint = "\(loginEndpoint)/verify-date-of-birth"
    public static let EnrollEndpoint = "\(loginEndpoint)/enroll"
    public static let getProfileStatusEndpoint = "\(loginEndpoint)/get-profile-status"
    public static let touchIddStatusEndpoint = "\(loginEndpoint)/touch-id"
    public static let verifyLoginDetailsEndpoint = "\(loginEndpoint)/verify-login-details"
    
    public static let validatePartnerPromoCodeEndpoint = "\(loginEndpoint)/validate-partner-promo-code"
    public static let getCaptchaEndpoint = "\(loginEndpoint)/v2/get-captcha"
    public static let getGuestUserEndpoint = "\(loginEndpoint)/login-guest-user"
    public static let getEligibilityMatrix = "\(loginEndpoint)/get-eligibility-matrix"
    
    //MARK:- Profile EndPoint
    
    public static let profileEndpoint = "profile"
    public static let enableTouchIdEndpoint = "\(profileEndpoint)/enable-touch-id"
    public static let changeMobileNumberEndpoint = "\(profileEndpoint)/change-mobile-number"
    public static let changeEmailAddressEndpoint = "\(profileEndpoint)/change-email-address"
    public static let saveUserCbdDetailEndpoint = "\(profileEndpoint)/save-user-cbd-Detail"
    public static let savePartnerDetailEndPoint = "\(profileEndpoint)/save-partner-detail"
    public static let getCbdDetailEndpoint = "\(profileEndpoint)/get-user-cbd-Detail"
    public static let deleteAccountEndpoint = "\(profileEndpoint)/v1/account-cancellation"
    public static let getDataAndPrivacyEndpoint = "\(profileEndpoint)/v1/account-cancellation-detail"

    // MARK: - Payment EndPoint
    
    public static let paymentEndpoint = "payment"
    public static let getManageCardEndpoint = "\(paymentEndpoint)/get-credit-cards"
    public static let deleteCreditCardEndpoint = "\(paymentEndpoint)/delete-credit-card"
//    static let getVoucherListEndpoint = "\(paymentEndpoint)/get-vouchers-list"
    public static let getVoucherListDetailsEndpoint = "\(paymentEndpoint)/get-voucher-details"
    public static let getBOGODetailEndPoint = "lifestyle/v2/lifestyle-offers"
    public static let lifestyleSubscriptionEndPoint = "\(paymentEndpoint)/lifestyle-subscription"
    
    public static let createPaymentEndPoint = "\(paymentEndpoint)/v1/create-payment"
    public static let createWalletPaymentEndPoint = "\(paymentEndpoint)/v1/wallet-payment"
    public static let getLinkedAcounts = "\(paymentEndpoint)/get-payment-linked-accounts"
    public static let getVoucherGiftImage = "\(paymentEndpoint)/get-voucher-gift"
    public static let getPromocodesList = "\(paymentEndpoint)/v1/promotions"
    public static let validatePromoGiftCode = "\(paymentEndpoint)/v1/validate-promo-and-gift"
    
    
    // MARK: - lifestyle EndPoint
    public static let lifestyleEndpoint = "lifestyle"
    public static let getLifestylePromoOfferEndPoint = "\(lifestyleEndpoint)/v1/lifestyle-promo-offer"
    public static let bogoTermsAndConditionsEndPoint = "\(lifestyleEndpoint)/v1/lifestyle-terms-and-condition"
    
    public static let applyPromoCodeEndPoint = "payment/validate-promo-code"
    public static let applyGiftCardEndPoint = "\(lifestyleEndpoint)/v1/validate-gift-code"
    //MARK:- gamification EndPoint
    
    
    public static let gamificationEndpoint = "gamification"
    public static let getDailyScratchCardEndpoint = "\(gamificationEndpoint)/get-daily-scratch-card"
    public static let getLotterySeries = "\(gamificationEndpoint)/spin-the-wheel/v1/lottery-series"
    public static let playSpinTheWheel = "\(gamificationEndpoint)/spin-the-wheel/v1/play-spin-the-wheel"
    
    // MARK: - faq EndPoint
    
    public static let faqEndpoint = "faq"
    public static let getFAQsEndpoint = "\(faqEndpoint)/get-Faqs"
    public static let getFAQsDetailsEndpoint = "\(faqEndpoint)/get-Faqs-details"
    
    // MARK: - faq EndPoint
    
    public static let giftEndPoint = "gift"
    public static let shareVoucherAsGiftEndpoint = "\(giftEndPoint)/share-voucher-as-gift"
    public static let viewVoucherAsGiftEndpoint = "\(giftEndPoint)/view-voucher-as-gift"
    public static let getBackgroundsEndpoint = "\(giftEndPoint)/get-gift-customization-background"
    
    // MARK: - faq EndPoint
    
    public static let gamificationEndPoint = "gamification/treasure-chest"
    public static let beginTreasureChectEndpoint = "\(gamificationEndPoint)/begin-treasure-chest"
    public static let treasureChestOptin = "\(gamificationEndPoint)/opt-in"
    public static let playTreasureChectEndpoint = "\(gamificationEndPoint)/play-treasure-chest"
    public static let spinTheWheelOptin = "gamification/spin-the-wheel/v1/opt-in"
    
    // MARK: - faq EndPoint
    
    public static let pointExchangeEndPoint = "point-exchange"
    public static let getAllPartnerPointsEndPoint = "\(pointExchangeEndPoint)/get-all-membership-data"
    public static let getAllConnectedPartnersEndPoint = "\(pointExchangeEndPoint)/get-membership-data"
    public static let getPointConversionTransactionListEndPoint = "\(pointExchangeEndPoint)/get-point-conversion-transaction-list"
    public static let stampLoginLogoutsEndPoint = "\(pointExchangeEndPoint)/stamp-login-logout"
    public static let stampOtpHashRequestEndPoint = "\(pointExchangeEndPoint)/stamp-otp-hash"
    public static let linkConversionProgramAccountEndPoint = "\(pointExchangeEndPoint)/link-conversion-program-account"
    public static let postTransactionToBlockchainEndPoint = "\(pointExchangeEndPoint)/post-transaction-to-blockchain"
    public static let getAllFilterForPartnersEndPoint = "\(pointExchangeEndPoint)/get-all-connected-partners"
    public static let getTransactionStatusEndPoint = "\(pointExchangeEndPoint)/get-transaction-status"
    public static let getLatestPartnerPointsEndPoint = "\(pointExchangeEndPoint)/get-latest-partner-points"
    public static let getTransactionHistoryFiltersEndPoint = "transaction/v1/get-transaction-filters"
    public static let getTransactionHistoryEndPoint = "transaction/v1/get-transactions-history"
    
    //MARK: - Locations
    
    public static let locationEndPoint = "location"
    public static let getLocationEndPoint = "\(locationEndPoint)/v1/get-location"
    public static let getCitiesEndPoint = "\(locationEndPoint)/v1/get-cities"
    public static let updateUserLocationEndpoint = "\(locationEndPoint)/v1/update-location"
    public static let getLocationEndpoint = "\(locationEndPoint)/v1/location"
   
    //MARK: - addresses Endpoints

    public static let addressEndPoint = "address"
    public static let getAllAdressesEndpoint = "\(addressEndPoint)/v1/get-all-addresses"
    public static let saveAddressEndpoint = "\(addressEndPoint)/v1/save-update-address"
    public static let removeAddressEndpoint = "\(addressEndPoint)/v1/remove-address"
    public static let saveDefaultAddressEndpoint = "\(addressEndPoint)/v1/save-default-address"
    
    ///

    //MARK: - Restaurant Endpoints
    
    //MARK: - menu Endpoints

    public static let menuListEndPoint = "menu-list"
    public static let getAdsWithTypeEndpoint = "\(menuListEndPoint)/v1/get-ads"
    public static let getRestaurantsListEndpoint = "\(menuListEndPoint)/v1/restaurants"
    public static let getQuickLinksEndpoint = "\(menuListEndPoint)/v1/get-quick-links"
    public static let getFavoritesEndpoint = "\(menuListEndPoint)/v1/get-favorites"
    public static let getRestaurantFiltersEndpoint = "\(menuListEndPoint)/v1/get-filters"
    public static let getRestaurantSortingsEndpoint = "\(menuListEndPoint)/v1/get-sorting"
    public static let getSearchResultsEndpoint = "\(menuListEndPoint)/v1/search"
    public static let getConfirmOrderEndpoint = "order/v1/order-confirm-status"
    public static let getOrderDetailEndpoint = "order/v1/order-details"
    public static let getOrderStatusEndpoint = "order/v1/order-tracking-status"
    public static let cancelOrderEndpoint = "order/v1/cancel-order"
    public static let getAbandonedCarts = "cart/v1/get-abandoned-cart"
    public static let clearCart = "cart/v1/clear-cart-item"
    public static let getOffersAndPromotions = "order/v1/get-offers-and-promotions"
    public static let applyPromoCode = "order/v1/apply-promo-code"
    public static let getOrderHistory = "order/v1/get-order-history"
    public static let reOrder = "order/v1/re-order-food"
    public static let pauseOrderEndPoint = "order/v1/pause-order"
    public static let resumeOrderEndPoint = "order/v1/resume-order"
    public static let changeTypeEndPoint = "order/v1/change-type"
    public static let getFavouriteRestaurantsEndPoint = "user/v1/get-favorite-restaurant"
    //Ramadan Feature
    public static let addInlineCartItem = "cart/v1/add-inline-item-cart"
    
    // Subscription Banner
    public static let getSubscriptionBanner = "\(menuListEndPoint)/v1/subscription-banner"
    
    //Order Rating
    public static let oderRatingEndPoint =  "order-review/v1/submit-reviews"
    //Restaurant enhancement
    public static let getPopularRestaurants = "\(menuListEndPoint)/v1/popular-restaurants"

    //MARK: Restaurant menu Endpoints
    public static let menuEndPoint = "menu"
    public static let getRestaurantDetailsEndpoint = "\(menuEndPoint)/v1/get-restaurant-details"
    public static let getRestaurantInfoEndpoint = "\(menuEndPoint)/v1/get-restaurant-info"
    public static let sendEmailVerification = "profile/send-verification-email"
    public static let validateOrderEndPoint = "cart/v1/validate-order"

    //MARK: Cart
    public static let cartEndPoint = "cart"
    public static let addToCart = "\(cartEndPoint)/v1/add-and-continue-to-cart"
    public static let getCartDetails = "\(cartEndPoint)/v1/cart-details"
    public static let updateCartDetails = "\(cartEndPoint)/v1/update-cart-item"
    public static let reduceAndUpdateCart = "\(cartEndPoint)/v1/reduce-and-update-from-cart"
    public static let validateBogoOffers = "cart/v1/validate-bogo-offer"
    public static let getCartSummary = "\(cartEndPoint)/v1/get-cart-summary"

       
    //MARK: - PaymentInfo EndPoints
    public static let paymentInfEndPoint = "payment"
    public static let getPaymentInfoEndPoint = "\(paymentInfEndPoint)/get-payment-info-v3"
    
    // MARK: - chatbot EndPoint
    
    public static let chatbotEndpoint = "chatbot"
    public static let getLiveChatDetailsEndPoint = "\(chatbotEndpoint)/get-live-chat-details"
    
    // MARK: - Mamba EndPoint
    
    public static let userEndpoint = "user"
    public static let registerUserLocationEndPoint = "\(userEndpoint)/v1/register"
    
    // MARK: Life Time Savings EndPoint
    public static let transactionEndpoint = "transaction"
    public static let lifeTimeSavingsTabsHeader = "\(transactionEndpoint)/v1/lifetime-savings-category"
    public static let lifeTimeSavings = "\(transactionEndpoint)/v1/lifetime-savings"
}
