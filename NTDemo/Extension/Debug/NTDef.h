//
//  NTDef.h
//  NTDemo
//
//  Created by Ganjiuhui on 9/26/19.
//  Copyright © 2019 Ganjiuhui. All rights reserved.
//

#ifndef NTDef_h
#define NTDef_h

#pragma mark - debug

#ifdef DEBUG

#define nt_debug(FORMAT, ...) fprintf(stderr,"\n\n%s:%d\t%s\t%s\n\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithUTF8String:__FUNCTION__] UTF8String],[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else

#define nt_debug(...)

#endif

#endif /* NTDef_h */
