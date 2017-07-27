//
//  MaketingPageVC.m
//  e-zhire
//
//  Created by Developer on 06/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "MaketingPageVC.h"
#import "MaketingVideoCell.h"
@interface MaketingPageVC ()
{
    NSArray*imageArr;
    NSInteger currentImage;
    BOOL checkVideo;
}
@end

@implementation MaketingPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    imageArr=[NSArray arrayWithObjects:@"clean",@"banner1",@"banner2",@"banner3",@"banner4",@"banner5",@"banner6", nil];
    self.photosImageView.image=[UIImage imageNamed:[imageArr objectAtIndex:currentImage]];
    self.aboutLabel.text=@"This is where you will upload your Profile photo. This photo will be seen by Clients, and should be framed with only your head and shoulders, plain background and no other person in the frame. You can drag & drop your photo  in the box below, or click  and then select the photo you will use from your browser. Then click  You may also rotate your photo if needed.This is where you will upload your Profile photo. This photo will be seen by Clients, and should be framed with only your head and shoulders, plain background and no other person in the frame. You can drag & drop your photo  in the box below, or click Browse and then select the photo you will use from your browser. Then click  You may also rotate your photo if needed.This is where you will upload your Profile photo. This photo will be seen by Clients, and should be framed with only your head and shoulders, plain background and no other person in the frame. You can drag & drop your photo  in the box below, or click and then select the photo you will use from your browser. Then click . You may also rotate your photo if needed.This is where you will upload your Profile photo. This photo will be seen by Clients, and should be framed with only your head and shoulders, plain background and no other person in the frame. You can drag & drop your photo  in the box below, or click  and then select the photo you will use from your browser. Then click  You may also rotate your photo if needed.";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- Ipad Font

-(void)ipadFontSize{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
//        [self.videoPhotoLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:22.0f]];
//        [self.reviewLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:22.0f]];
//        [self.commentLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
//        [self.ratingLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
//        [self.aboutTextLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
    }else{
        
    }
}

#pragma mark - UICollectionView Datasource and Delegate

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == [collectionView numberOfItemsInSection:indexPath.section] - 1) {
        
        //     [self reloadDataFromNetwork];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 4;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
      MaketingVideoCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"MaketingVideoCell" forIndexPath:indexPath];
      cell.photosImg.image=[UIImage imageNamed:[imageArr objectAtIndex:indexPath.row]];
        
        return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    currentImage=indexPath.item;
    self.leftArrowBtn.enabled = YES;
    self.rightArrowBtn.enabled = YES;
    NSString *getImagePath = [imageArr objectAtIndex:indexPath.row];
    [self.photosImageView setImage:[UIImage imageNamed:getImagePath]];
    [self.collectionView reloadData];
}

#pragma mark- Button Action

- (IBAction)addEditPicAction:(id)sender {
    
    checkVideo=YES;
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"" message:@"Change Profile image" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *takePhoto=[UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"No Camera Available." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            alert = nil;
        }
    }];
    [alertController addAction:takePhoto];

    UIAlertAction *choosePhoto=[UIAlertAction actionWithTitle:@"Select From Photos" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        UIImagePickerController *pickerView = [[UIImagePickerController alloc] init];
        pickerView.allowsEditing = YES;
        pickerView.delegate = self;
        [self presentViewController:pickerView animated:YES completion:NULL];
        [alertController dismissViewControllerAnimated:YES completion:nil];
        
    }];
    [alertController addAction:choosePhoto];
    UIAlertAction *actionCancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:actionCancel];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)addEditAboutAction:(id)sender {
    
    CGRect size=self.aboutView.bounds;
    size.origin.y=30;
    size.origin.x=35;
    self.aboutView.frame=size;
    [self.view addSubview:self.aboutView];
    self.maketingScrollView.userInteractionEnabled=NO;
    self.aboutView.hidden=NO;
    
   }

- (IBAction)leftArrowAction:(UIButton*)sender {
    
    if (currentImage > 0) {
        currentImage = currentImage-1;
        sender.enabled = currentImage == 0?NO:YES;
        self.rightArrowBtn.enabled = YES;
        NSString *getImagePath = [imageArr objectAtIndex:currentImage];
        [self.photosImageView setImage:[UIImage imageNamed:getImagePath]];
        [self.collectionView reloadData];
    }
}
- (IBAction)rightArrowAction:(UIButton*)sender {
    if(currentImage < imageArr.count-1) {
        currentImage = currentImage+1;
        sender.enabled = currentImage == imageArr.count-1?NO:YES;
        self.leftArrowBtn.enabled = YES;
        NSString *getImagePath = [imageArr objectAtIndex:currentImage];
        [self.photosImageView setImage:[UIImage imageNamed:getImagePath]];
        [self.collectionView reloadData];
    }
}


- (IBAction)addEditVideoAction:(id)sender {
    self.videoEditFontLabel.text=@"Video";
    self.videoPopLabel.text=@"This section is where you will want to upload your Promotional videos.  A video is the most effective marketing tool you will have to help you convince a Client to purchase your services. You can upload as many as 10 videos for your Clients to view from your Marketing page.  All videos can be seen on your Marketing page by Client. Just drag-&-drop the video inside the box below. You also have the option to enter the URL of a video you already have uploaded on another service such a YouTube or Vimeo.  A successful upload will create a video thumbnail below. For uploading, most video formats are accepted, but file size may not exceed 200mb per video. Your Mentor can help you compress your videos if larger than 200mb.";
    
    [self.addVideoBtn setTitle:@"Add Video" forState:UIControlStateNormal];
    [self.selectVideoButton setTitle:@"Select Video" forState:UIControlStateNormal];
    [self.deleteHighlightedBtn setTitle:@"Delete Hightlighted Video" forState:UIControlStateNormal];
    
    [self addView];
    
}

- (IBAction)addEditPhotosAction:(id)sender {
    self.videoEditFontLabel.text=@"Photo";
    self.videoPopLabel.text=@"This section is for you to upload any photos that may help a Client see and understand how qualified you are to perform the service. You may drag-&-drop a file (or multiple files) inside the  “Drag & Drop” box area.  Another option instead or drag-&-drop is to click “Select Files”, then choose a file from your browser, then select ”Upload” to save.  Items successfully upload will create a photo thumbnail below. You may also delete any item from this list by selecting it and clicking  “Delete Highlighted Photo”";
    [self.addVideoBtn setTitle:@"Select files" forState:UIControlStateNormal];
    [self.selectVideoButton setTitle:@"Upload" forState:UIControlStateNormal];
    [self.deleteHighlightedBtn setTitle:@"Delete Hightlighted Photo" forState:UIControlStateNormal];
    
    [self addView];

}

- (IBAction)closeViewAction:(id)sender {

    [self.aboutView removeFromSuperview];
    self.maketingScrollView.userInteractionEnabled=YES;
}


- (IBAction)saveAndCloseAction:(id)sender {

}

- (IBAction)addVideoAction:(id)sender {

    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        // Cancel button tappped do nothing //
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Take video  " style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [EZCommonMethod showAlert:@"Oops," message:@"Device has no camera"];
            return;
        }
        else {
            
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = YES;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.mediaTypes =[[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
            [self presentViewController:picker animated:YES completion:NULL];
            
        }
    }]];

    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Choose Video" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.mediaTypes = @[(NSString*)kUTTypeMovie, (NSString*)kUTTypeAVIMovie, (NSString*)kUTTypeVideo, (NSString*)kUTTypeMPEG4];
        [self presentViewController:picker animated:YES completion:NULL];
    }]];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}

- (IBAction)deleteHightlightedAction:(id)sender {
}

- (IBAction)videoClosePopupAction:(id)sender {
    
   // self.editVideoView.hidden = YES;
    [self.editVideoView removeFromSuperview];
    self.maketingScrollView.userInteractionEnabled=YES;
    
}

- (IBAction)videoSaveAndCloseAction:(id)sender {
    
}

- (IBAction)selectVideoFileAction:(id)sender {

}

#pragma mark- Profile picker delegate

/*
 - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
 UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
 self.profileImgage.image = chosenImage;
 [picker dismissViewControllerAnimated:YES completion:NULL];
 if (checkVideo) {
 UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
 self.profileImgage.image = chosenImage;
 [picker dismissViewControllerAnimated:YES completion:NULL];
 }else{
 NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
 [self dismissViewControllerAnimated:NO completion:NULL];
 // Handle a movie capture
 if (CFStringCompare ((__bridge_retained CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo) {
 NSString *moviePath = [[info objectForKey:UIImagePickerControllerMediaURL] path];
 if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(moviePath)) {
 UISaveVideoAtPathToSavedPhotosAlbum(moviePath, self, nil, nil);
 }
 }
 }
 }
 */

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *date = [self currentDateandTime];
    UIImage* SelectedImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@_image.jpg",date]];
    NSURL *urlimage = [NSURL URLWithString:imagePath];
    NSLog(@"%@",urlimage);
    NSURL* videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    
    if (CFStringCompare ((__bridge CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo) {
        videoURL=(NSURL*)[info objectForKey:UIImagePickerControllerMediaURL];
    }
    
    self.profileImgage.image = SelectedImage;
    //    _textViewUpperConstait.constant=41;
    //    _textViewWidthContrait.constant=self.view.bounds.size.width-24;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (NSString *)currentDateandTime {
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMddyyyy_HHmmssSS"];
    NSString *dateString = [dateFormat stringFromDate:today];
    return dateString;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(void) addView {
    CGRect size=self.editVideoView.bounds;
    size.origin.y=10;
    size.origin.x=35;
    self.editVideoView.frame=size;
    [self.view addSubview:self.editVideoView];
    self.maketingScrollView.userInteractionEnabled=NO;
    self.editVideoView.hidden=NO;
}


@end
