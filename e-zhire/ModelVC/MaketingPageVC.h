//
//  MaketingPageVC.h
//  e-zhire
//
//  Created by Developer on 06/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaketingPageVC : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *profileImgage;
- (IBAction)addEditPicAction:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *associateIdLabel;
- (IBAction)addEditAboutAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *aboutLabel;
- (IBAction)leftArrowAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *photosImageView;
- (IBAction)rightArrowAction:(id)sender;
- (IBAction)addEditVideoAction:(id)sender;
- (IBAction)addEditPhotosAction:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *aboutMeFontLabel;
@property (weak, nonatomic) IBOutlet UIButton *addEditPhotosBtn;
@property (weak, nonatomic) IBOutlet UIButton *addEditAboutBtn;
@property (weak, nonatomic) IBOutlet UILabel *videoPhotosLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileFrontLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftArrowBtn;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *rightArrowBtn;
@property (weak, nonatomic) IBOutlet UILabel *reviewLabel;
@property (weak, nonatomic) IBOutlet UIButton *addEditVideoBtn;
- (IBAction)closeViewAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *aboutDetailLabel;
@property (weak, nonatomic) IBOutlet UITextView *aboutTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *maketingScrollView;
@property (strong, nonatomic) IBOutlet UIView *aboutView;
@property (weak, nonatomic) IBOutlet UILabel *videoEditFontLabel;
- (IBAction)saveAndCloseAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *allDetailView;
@property (weak, nonatomic) IBOutlet UILabel *videoPopLabel;
@property (weak, nonatomic) IBOutlet UIButton *addVideoBtn;
@property (weak, nonatomic) IBOutlet UITextField *videoUrlTextField;
@property (weak, nonatomic) IBOutlet UILabel *orLabelFont;
- (IBAction)addVideoAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *videoUrlLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrengeOrderLabel;
- (IBAction)deleteHightlightedAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *deleteHighlightedBtn;
@property (weak, nonatomic) IBOutlet UILabel *highlightLabel;
@property (weak, nonatomic) IBOutlet UIButton *videoSaveAndCloseBtn;
@property (strong, nonatomic) IBOutlet UIView *editVideoView;
- (IBAction)videoClosePopupAction:(id)sender;
- (IBAction)videoSaveAndCloseAction:(id)sender;
- (IBAction)selectVideoFileAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *selectVideoButton;
@property (weak, nonatomic) IBOutlet UICollectionView *addVideoCollectionView;
@end
