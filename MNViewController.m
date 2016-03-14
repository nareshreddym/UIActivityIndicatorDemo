//
//  MNViewController.h
//  UIActivityIndiactorDemo
//
//  Created by Naresh Reddy M on 04/03/16.
//  Copyright © 2016 Naresh Reddy M. All rights reserved.
//



@implementation MNViewController
-(UIActivityIndicatorView *)getSpinner
{
    static UIActivityIndicatorView *spinnerView = nil;
    if(!spinnerView)
    {
        spinnerView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [spinnerView setFrame:(CGRect){0,0,CGRectGetWidth([[[[UIApplication sharedApplication] delegate] window] frame]),CGRectGetHeight([[[[UIApplication sharedApplication] delegate] window] frame])}];
        [spinnerView setCenter:[[[UIApplication sharedApplication] delegate] window].center];
    }
    return spinnerView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self getSpinner] startAnimating];
    [[self getSpinner] setBackgroundColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.5]];
    [[self getSpinner] setColor:[UIColor blueColor]];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:[self getSpinner]];
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [self performSelector:@selector(hideLoadingBar:) withObject:[self getSpinner] afterDelay:5.0];
                   });
}
-(void)hideLoadingBar:(UIActivityIndicatorView *)loadingBar
{
    [loadingBar stopAnimating];
    [loadingBar removeFromSuperview];
    loadingBar = nil;
}
-(void)hideLoadingBar:(UIActivityIndicatorView *)loadingBar
{
    [loadingBar stopAnimating];
    [loadingBar removeFromSuperview];
    loadingBar = nil;
}
@end
