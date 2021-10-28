//
//  ItemDetailsViewController.h
//  DubizzleClassified
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

#import <UIKit/UIKit.h>
@class ItemsDataModel;
@class ImageLoader;
@class AttributedString;

NS_ASSUME_NONNULL_BEGIN

@interface ItemDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *fullImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic,strong) ItemsDataModel *selectedItem;

@end

NS_ASSUME_NONNULL_END
