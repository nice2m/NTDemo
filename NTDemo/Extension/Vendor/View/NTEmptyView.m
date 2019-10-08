//
//  NTEmptyView.m
//  RumHeadLine
//
//  Created by   on 2019/8/9.
//  Copyright © 2019 Wu. All rights reserved.
//
#import <objc/message.h>
#import "UIView+NTExtension.h"
#import "NTEmptyPlaceHolderConfig.h"

#import "NTEmptyView.h"


static char const kLoadingPlaceHolderKey;
static char const kEmptyPlaceHolderKey;
@implementation UIView (nt_emptyPlaceHolder)

- (void)nt_showActivityLoadingDetail:(NSString *)detailString
{
    [self nt_hideActivityLoading];
    
    NTEmptyView * emp = [NTEmptyView emptyViewWithCustomView:[self indicatorContainerWithText:detailString]];
    
    [self addSubview:emp];
    [self bringSubviewToFront:emp];
    objc_setAssociatedObject(self, &kLoadingPlaceHolderKey, emp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)nt_hideActivityLoading
{
    UIView *pre = objc_getAssociatedObject(self, &kLoadingPlaceHolderKey);
    [pre removeFromSuperview];
}

- (void)nt_showEmptyPlaceHolderIconName:(NSString *)iconName titleString:(NSString *)titleString
{
    [self nt_showEmptyPlaceHolderIconName:iconName titleString:[self defaultAttributedTitle:titleString] detailString:[NSAttributedString new] actionAttributedString:[NSAttributedString new] actionBgColor:nil actionBlock:^(id  _Nonnull sender) {
            //
    } bgContainerTapBlock:^(id  _Nonnull sender) {
            //
    }];
}
- (void)nt_showEmptyPlaceHolderIconName:(NSString *)iconName titleString:(NSString *)titleString actionTitle:(NSString *)actionTitle actionBlock:(NTBaseEmptyViewActionBlock)actionBlock
{
    [self nt_showEmptyPlaceHolderIconName:iconName titleString:[self defaultAttributedTitle:titleString] detailString:[NSAttributedString new] actionAttributedString:[self defaultActionBtnAttributedNormalState:actionTitle] actionBgColor:nil actionBlock:actionBlock bgContainerTapBlock:^(id  _Nonnull sender) {
            //
    }];
}

- (void)nt_showEmptyPlaceHolderIconName:(NSString *)iconName titleString:(NSAttributedString *)titleString detailString:(NSAttributedString *)detailString actionAttributedString:(NSAttributedString *)actionAttrString actionBgColor:(UIColor  * _Nullable )actionBgColor actionBlock:(NTBaseEmptyViewActionBlock)actionBlock bgContainerTapBlock:(NTBaseEmptyViewActionBlock)bgTapBlock
{
    [self nt_hideEmptyPlaceHolder];
    NTEmptyView * emptView = [NTEmptyView new];
    emptView.iconImgName = iconName;
    emptView.titleAttrStr = titleString;
    emptView.detailAttrStr = detailString;
    emptView.actionBtnAttrStr = actionAttrString;
    
    emptView.actionBtnBgColor = actionBgColor ? actionBgColor : NTEmptyPlaceHolderActionDefaultBGColor;
    emptView.actionBtnBorderColor = NTEmptyPlaceHolderActionDefaultBorderColor;
    emptView.actionBtnBorderWidth = NTEmptyPlaceHolderActionDefaultBorderWidth;
    emptView.actionBtnCornerRadius = NTEmptyPlaceHolderActionDefaultCornerRadius;
    
    emptView.containerBgColor = NTEmptyPlaceHolderDefaultContainerBgColor;
    emptView.verticalMargin = NTEmptyPlaceHolderDefaultContentItemsVerticalSpace;
    emptView.contentCenterOffSet = NTEmptyPlaceHolderDefaultContentCenterOffSet;
    
    [self addSubview:emptView];
    [self bringSubviewToFront:emptView];
    objc_setAssociatedObject(self, &kEmptyPlaceHolderKey, emptView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)nt_hideEmptyPlaceHolder
{
    UIView *pre = objc_getAssociatedObject(self, &kEmptyPlaceHolderKey);
    [pre removeFromSuperview];
}

#pragma mark - private
- (NSAttributedString *)defaultAttributedTitle:(NSString *)title
{
    return [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:NTEmptyPlaceHolderTitleDefaultColor,NSFontAttributeName:NTEmptyPlaceHolderTitleDefaultFont}];
}
- (NSAttributedString *)defaultAttributedDetail:(NSString *)detail
{
    return [[NSAttributedString alloc] initWithString:detail attributes:@{NSForegroundColorAttributeName:NTEmptyPlaceHolderDetailDefaultColor,NSFontAttributeName:NTEmptyPlaceHolderDetailDefaultFont}];
}
- (NSAttributedString *)defaultActionBtnAttributedNormalState:(NSString *)actionTitle
{
    return [[NSAttributedString alloc] initWithString:actionTitle attributes:@{NSForegroundColorAttributeName:NTEmptyPlaceHolderActionDefaultTitleColor,NSFontAttributeName:NTEmptyPlaceHolderActionDefaultTitleFont}];
}

- (UIView *)indicatorContainerWithText:(NSString *)text
{
    CGFloat containerHeight = 0;
    CGFloat containerWidth = 0;
    CGFloat subViewFloatY = 0;
    
    UIView * rt = [UIView new];
        //    rt.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    rt.backgroundColor = [UIColor clearColor];
    UIActivityIndicatorView * indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [rt addSubview:indicator];
    [indicator setFrame:CGRectMake(0, 0, 20, 20)];
    containerHeight = indicator.nt_maxY;
    containerWidth = indicator.nt_maxX;
    subViewFloatY = indicator.nt_maxY;
    
    
    if (text.length > 0)
    {
        UILabel * lbl = [UILabel new];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.textColor = [UIColor lightGrayColor];
        lbl.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        lbl.text = text;
        [rt addSubview:lbl];
        CGSize aSize = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular]}];
        lbl.frame = CGRectMake(0, indicator.nt_maxY + 4, aSize.width + 2, aSize.height + 2);
        
        
        
        containerHeight = lbl.nt_maxY;
        if (containerWidth < aSize.width) {containerWidth = aSize.width ;}
        subViewFloatY = lbl.nt_maxY;
        
        rt.frame = CGRectMake(0, 0, containerWidth, subViewFloatY);
        indicator.nt_centerX = CGRectGetMidX(rt.bounds);
        lbl.nt_centerX = CGRectGetMidX(rt.bounds);
        lbl.nt_y = indicator.nt_maxY + 4;
    }
    else
    {
        rt.frame = CGRectMake(0, 0, containerWidth, subViewFloatY);
        indicator.nt_centerX = CGRectGetMidX(rt.bounds);
        indicator.nt_centerY = CGRectGetMidY(rt.bounds);
        
    }
    
    [indicator startAnimating];
    
    return rt;
}

@end


@interface NTEmptyView ()

@property (nonatomic, strong) UIImageView *emptyImageView;
@property (nonatomic, strong) UILabel *emptyTitleLbl;
@property (nonatomic, strong) UILabel *emptyDetailLbl;
@property (nonatomic, strong) UIButton *actionBtn;

@end

@implementation NTEmptyView
{
    CGFloat contentMaxWidth;
    CGFloat contentVerticalFloatY;
    CGFloat contentMaxHeight;
}

+ (instancetype)emptyViewWithCustomView:(UIView *)customView
{
    NTEmptyView * view = [[NTEmptyView alloc] init];
    view.customView = customView;
    return view;
}

#pragma mark -
- (instancetype)init
{
    if (self = [super init])
    {
        [self configSubView];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    contentMaxWidth = newSuperview.nt_width - 24;
    contentMaxHeight = newSuperview.nt_height - 24;

}

- (void)layoutSubviews
{
    [super layoutSubviews];
        // 设置frame
    if (!self.customView)
    {
        [self setupNormalFrame];
    }
    else
    {
        [self setupCustomFrame];
    }
    self.backgroundColor = self.containerBgColor;
}
#pragma mark - private

- (void)configSubView
{
    // init config
    
    [self.contentView addSubview:self.emptyImageView];
    [self.contentView addSubview:self.emptyTitleLbl];
    [self.contentView addSubview:self.emptyDetailLbl];
    [self.contentView addSubview:self.actionBtn];
    
    // setup
}



- (CGFloat)comparedByMaxContentWidthWithWidth:(CGFloat)aWidth
{
    if (aWidth > contentMaxWidth)
    {
        return contentMaxWidth;
    }
    return aWidth;
}

- (CGFloat)comparedByMaxContentHeightWithHeight:(CGFloat)aHeight
{
    if (aHeight > contentMaxHeight)
    {
        return contentMaxHeight;
    }
    return aHeight;
}

- (void)setupNormalFrame
{
    CGFloat contentComputWidth = 0;
    
    CGSize imgSize = self.emptyImageView.image.size;
    self.emptyImageView.frame = CGRectMake(0, 0, imgSize.width, imgSize.height);
    contentVerticalFloatY = imgSize.height;
    contentComputWidth = imgSize.width;
    
    CGSize titleSize = [self.emptyTitleLbl sizeThatFits:CGSizeMake(contentMaxWidth, contentMaxHeight)];
    self.emptyTitleLbl.frame = CGRectMake(0, contentVerticalFloatY + self.verticalMargin, titleSize.width, titleSize.height);
    contentVerticalFloatY = self.emptyTitleLbl.nt_maxY;
    if (titleSize.width > contentComputWidth) { contentComputWidth = titleSize.width;}
    
    CGSize emptyDetailSize = [self.emptyDetailLbl sizeThatFits:CGSizeMake(contentMaxWidth, contentMaxHeight)];
    self.emptyDetailLbl.frame = CGRectMake(0, contentVerticalFloatY + self.verticalMargin, emptyDetailSize.width, emptyDetailSize.height);
    contentVerticalFloatY = self.emptyDetailLbl.nt_maxY;
    if (emptyDetailSize.width > contentComputWidth) { contentComputWidth = emptyDetailSize.width;}
    
    CGSize actionSize = [self.actionBtn sizeThatFits:CGSizeMake(contentMaxWidth, contentMaxHeight)];
    if (self.actionBtnAttrStr.length > 0)
    {
        self.actionBtn.frame = CGRectMake(0, contentVerticalFloatY + self.verticalMargin, actionSize.width, actionSize.height);
        contentVerticalFloatY = self.actionBtn.nt_maxY;
        if (actionSize.width > contentComputWidth) { contentComputWidth = actionSize.width;}
    }
    
    self.contentView.nt_width = [self comparedByMaxContentWidthWithWidth:contentComputWidth];
    self.contentView.nt_height = [self comparedByMaxContentHeightWithHeight:contentVerticalFloatY];
    
    CGFloat centerX = CGRectGetMidX(self.bounds);
    CGFloat centerY = CGRectGetMidY(self.bounds);
    self.contentView.nt_centerX = centerX;
    self.contentView.nt_centerY = centerY + self.contentCenterOffSet;
    
    CGFloat itemCenterX = CGRectGetMidX(self.contentView.bounds);
    self.emptyImageView.nt_centerX = itemCenterX;
    self.emptyTitleLbl.nt_centerX = itemCenterX;
    self.emptyDetailLbl.nt_centerX = itemCenterX;
    self.actionBtn.nt_centerX = itemCenterX;
}
- (void)setupCustomFrame
{
    self.contentView.nt_width = [self comparedByMaxContentWidthWithWidth:self.customView.nt_width];
    self.contentView.nt_height = [self comparedByMaxContentHeightWithHeight:self.customView.nt_height];
    
    self.contentView.nt_centerX = CGRectGetMidX(self.bounds);
    self.contentView.nt_centerY = CGRectGetMidY(self.bounds) + self.contentCenterOffSet;

    self.customView.nt_centerX = CGRectGetMidX(self.contentView.bounds);
    self.customView.nt_centerY = CGRectGetMidY(self.contentView.bounds);
}


#pragma mark -

- (void)invokeEmptyContainerBlock
{
    self.emptyContainerTapBlock ? self.emptyContainerTapBlock(self) : nil;
}
- (void)invokeActionBlock
{
    self.actionBtnBlock ? self.actionBtnBlock(self.actionBtn) : nil;
}

#pragma mark -

- (void)setActionBtnCornerRadius:(CGFloat)actionBtnCornerRadius
{
    _actionBtnCornerRadius = actionBtnCornerRadius;
    [self setNeedsLayout];
}
- (void)setActionBtnBorderWidth:(CGFloat)actionBtnBorderWidth
{
    _actionBtnBorderWidth = actionBtnBorderWidth;
    [self setNeedsLayout];
}

- (void)setActionBtnBgColor:(UIColor *)actionBtnBgColor
{
    _actionBtnBgColor = actionBtnBgColor;
    [self setNeedsLayout];
}

- (void)setActionBtnBorderColor:(UIColor *)actionBtnBorderColor
{
    _actionBtnBorderColor = actionBtnBorderColor;
    [self setNeedsLayout];
}

- (void)setContentCenterOffSet:(CGFloat)contentCenterOffSet
{
    _contentCenterOffSet = contentCenterOffSet;
    [self setNeedsLayout];
}
- (void)setCustomView:(UIView *)customView
{
    _customView = customView;
    [self.contentView addSubview:customView];
    [self setNeedsLayout];
}

- (void)setIconImgName:(NSString *)iconImgName
{
    _iconImgName = iconImgName;
    self.emptyImageView.image = [UIImage imageNamed:iconImgName];
    [self setNeedsLayout];
;
}

- (void)setTitleAttrStr:(NSAttributedString *)titleAttrStr
{
    _titleAttrStr = titleAttrStr;
    self.emptyTitleLbl.attributedText = titleAttrStr;
    [self setNeedsLayout];

}

- (void)setDetailAttrStr:(NSAttributedString *)detailAttrStr
{
    _detailAttrStr = detailAttrStr;
    self.emptyDetailLbl.attributedText = detailAttrStr;
    [self setNeedsLayout];

}
- (void)setActionBtnAttrStr:(NSAttributedString *)actionBtnAttrStr
{
    _actionBtnAttrStr = actionBtnAttrStr;
    [self.actionBtn setAttributedTitle:actionBtnAttrStr forState:UIControlStateNormal];
    [self setNeedsLayout];
}

- (UIImageView *)emptyImageView
{
    if (!_emptyImageView)
    {
        UIImageView *img = [UIImageView new];
        img.clipsToBounds = YES;
        img.contentMode = UIViewContentModeScaleAspectFit;
        _emptyImageView = img;
    }
    return _emptyImageView;
}
- (UILabel *)emptyTitleLbl
{
    if (!_emptyTitleLbl)
    {
        UILabel * lbl = [UILabel new];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.textColor = [UIColor darkTextColor];
        lbl.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        lbl.text = @"";
        lbl.numberOfLines = 0;
        [lbl setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
        _emptyTitleLbl = lbl;

    }
    return _emptyTitleLbl;
}

- (UILabel *)emptyDetailLbl
{
    if (!_emptyDetailLbl)
    {
        UILabel * lbl = [UILabel new];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.textColor = [UIColor lightTextColor];
        lbl.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [lbl setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
        lbl.text = @"";
        lbl.numberOfLines = 0;
        _emptyDetailLbl = lbl;
    }
    
    return _emptyDetailLbl;
}

- (UIButton *)actionBtn
{
    if (!_actionBtn)
    {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionBtn = btn;
    }
    [_actionBtn addTarget:self action:@selector(invokeActionBlock) forControlEvents:UIControlEventTouchUpInside];
    [_actionBtn setBackgroundColor:self.actionBtnBgColor];
    _actionBtn.layer.masksToBounds = YES;
    _actionBtn.layer.borderWidth = self.actionBtnBorderWidth;
    _actionBtn.layer.borderColor = self.actionBtnBorderColor.CGColor;
    _actionBtn.layer.cornerRadius = self.actionBtnCornerRadius;

    return _actionBtn;
}

@end
