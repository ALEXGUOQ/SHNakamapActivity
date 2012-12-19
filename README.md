SHNakamapActivity
=================

UIActivity for Nakamap  
[http://nakamap.com/](http://nakamap.com/)

###Usage:

    SHNakamapActivity *nakamapActivity = [[SHNakamapActivity alloc] init];
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:@[@"Message"]
                                                                               applicationActivities:@[nakamapActivity]];
    [self presentViewController:activityView animated:YES completion:nil];
    
###License:

MIT License


