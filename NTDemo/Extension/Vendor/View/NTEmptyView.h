//
//  NTEmptyView.h
//  RumHeadLine
//
//  Created by Ganjiuhui on 2019/8/9.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "NTBaseEmptyView.h"

/*
 usage example:
 
 
 1.config the default implementation at file NTEmptyPlaceHolderConfig.h
 
 2. use as UIView (nt_emptyPlaceHolder)
 
 Tips:
 
 
 */
NS_ASSUME_NONNULL_BEGIN

@interface UIView (nt_emptyPlaceHolder)


/**
 show a UIActivityIndicatorView and a UILabel centerX aligned topmost to the receiver

 @param detailString the describe string of the UILabel below the UIActivityIndicatorView
 */
- (void)nt_showActivityLoadingDetail:(NSString *)detailString;

/**
 hide the loading view trigged by - (void)nt_showActivityLoadingDetail:(NSString *)detailString;
 */
- (void)nt_hideActivityLoading;


/**
 show a UIImage and a UILabel centerX aligned ,containded by a NTEmptyPlaceHolderDefaultContainerBgColor colored, and topmost to the receiver

 @param iconName name of the image in assets or bundle
 @param titleString the string show bellow the image
 */
- (void)nt_showEmptyPlaceHolderIconName:(NSString *)iconName titleString:(NSString *)titleString;

/**
 show a UIImage and UILabel and UIButton CenterX aligned ,containded by a NTEmptyPlaceHolderDefaultContainerBgColor colored ,and topmost to the receiver

 @param iconName name of the image in assets or bundle
 @param titleString the title string shown below the image
 @param actionTitle the action button title
 @param actionBlock the action block
 */
- (void)nt_showEmptyPlaceHolderIconName:(NSString *)iconName titleString:(NSString *)titleString actionTitle:(NSString *)actionTitle actionBlock:(NTBaseEmptyViewActionBlock)actionBlock;


/**
 show a UIImage and a UILabel and a UILabel and a UIButton centerX aligned,vertical space at NTEmptyPlaceHolderDefaultContentItemsVerticalSpace,topmost to the receiver

 @param iconName the image name in assets or bundle
 @param titleString the title name attributed
 @param detailString the detailed attributed string
 @param actionAttrString the title of a action button
 @param actionBgColor the background color of the action button
 @param actionBlock the action block
 @param bgTapBlock the block executed when container view colored in  NTEmptyPlaceHolderDefaultContainerBgColor taped
 */
- (void)nt_showEmptyPlaceHolderIconName:(NSString *)iconName titleString:(NSAttributedString *)titleString detailString:(NSAttributedString *)detailString actionAttributedString:(NSAttributedString *)actionAttrString actionBgColor:(UIColor *_Nullable )actionBgColor actionBlock:(NTBaseEmptyViewActionBlock)actionBlock bgContainerTapBlock:(NTBaseEmptyViewActionBlock)bgTapBlock;

/**
 show a UIImage and a UILabel and a UILabel and a UIButton centerX aligned,vertical space at NTEmptyPlaceHolderDefaultContentItemsVerticalSpace,topmost to the receiver
 
 @param iconName the image name in assets or bundle
 @param titleString the title name attributed
 @param detailString the detailed attributed string
 @param actionAttrString the title of a action button
 @param actionBgColor the background color of the action button
 @param actionBlock the action block
 @param bgTapBlock the block executed when container view colored in  NTEmptyPlaceHolderDefaultContainerBgColor taped
 @param contentCenterYOffset the centerY offset of the contents:UIImage & UILabel & UIlabel * UIButton as an Unit;
 */
- (void)nt_showEmptyPlaceHolderIconName:(NSString *)iconName titleString:(NSAttributedString *)titleString detailString:(NSAttributedString *)detailString actionAttributedString:(NSAttributedString *)actionAttrString actionBgColor:(UIColor *_Nullable )actionBgColor contentCenterYOffset:(CGFloat)contentCenterYOffset actionBlock:(NTBaseEmptyViewActionBlock)actionBlock bgContainerTapBlock:(NTBaseEmptyViewActionBlock)bgTapBlock;
/**
 hide the empty placeholder triggered by -(void)nt_showEmptyPlaceHolderIconName: of the receiver
 */
- (void)nt_hideEmptyPlaceHolder;

@end


@interface NTEmptyView : NTBaseEmptyView

@property (nonatomic, strong) UIView *customView;

@property (nonatomic, strong)NSString * iconImgName;
@property (nonatomic, strong)NSAttributedString *titleAttrStr;
@property (nonatomic, strong)NSAttributedString *detailAttrStr;
@property (nonatomic, strong)NSAttributedString *actionBtnAttrStr;
@property (nonatomic, strong)UIColor *containerBgColor;

@property (nonatomic, strong)UIColor *actionBtnBgColor;
@property (nonatomic, assign)CGFloat actionBtnCornerRadius;
@property (nonatomic, assign)CGFloat actionBtnBorderWidth;
@property (nonatomic, strong)UIColor *actionBtnBorderColor;

@property (nonatomic, assign)CGFloat verticalMargin;
@property (nonatomic, assign)CGFloat contentCenterOffSet;

+ (instancetype)emptyViewWithCustomView:(UIView *)customView;
@end



NS_ASSUME_NONNULL_END
