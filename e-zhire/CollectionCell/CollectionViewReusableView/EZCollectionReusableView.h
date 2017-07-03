//
//  EZCollectionReusableView.h
//  OpenShop
//
//  Created by Jirka Apps
//  Copyright (c) 2015 Business Factory. All rights reserved.
//


NS_ASSUME_NONNULL_BEGIN

/**
 * `EZCollectionReusableView` is a base collection view header or footer view wrapper
 * to be subclassed for further use if needed. It contains basic properties and it
 * manages their appearance according to the requirements.
 */
@interface EZCollectionReusableView : UICollectionReusableView

/**
 * The activity indicator.
 */
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicator;


@end

NS_ASSUME_NONNULL_END
