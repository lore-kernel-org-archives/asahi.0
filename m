Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4132E3390
	for <asahi@lists.linux.dev>; Tue, 15 Jul 2025 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585661; cv=none; b=lJa2i5GVj8QxxpgQxQsPtatzAYjg6mmmq7x+gcaS41HOfJ0+LJNQeZUoQccDE+9F+pALLZC+xRZy2AvUsLJN0t9rGTJdMKleTWIoM2fBnhXMHFsxeQmMVEhsdsX7RFv+L+G26Jwco7iYNc4FZrzR2mN4cHwrKUL+1oEEvPVKj3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585661; c=relaxed/simple;
	bh=iTD6QvZiqKeEPSTRArjSPKCxmJgkIkYH4P8NnK2Uek4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRie+U698j7KnQsQ/b3rDGWThw8vPisZYnX+7w4x/BceZMEzhrg0Rc52f6ct0Ah0oQhNIpWipRXsm9Nn10bmeuTC13Tpoyqj/9VgM0y+g96Anjnf1O2PEbCrjVED0SsHFufNjTZIE6dl0iqU5YfcgjYgFKtoG/z4RHkaFd/abpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=XwimvGoY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="XwimvGoY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45348bff79fso62693405e9.2
        for <asahi@lists.linux.dev>; Tue, 15 Jul 2025 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1752585658; x=1753190458; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2aER99iRVzHm/yjHj1djxkk2abTrxMFAl8DKmvxNC7E=;
        b=XwimvGoYGKDOVBjpbjlKE9HK0+yaCYMPsUdKuxU1MgZH0U5YT7XQUy64XxOaadmX9Y
         IlR/mnYjdd2RrQHIzwX7JfQX6HLoH5u+rFpi/oSkWNGdTFR3YNphAP+gen+bAJv0Qu6C
         vLTgoWAbL0CxJRnvoxPQTxUqL7EbGq1HB3QC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585658; x=1753190458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aER99iRVzHm/yjHj1djxkk2abTrxMFAl8DKmvxNC7E=;
        b=E7mbHMZNigYPvms5qjES/oE1J1pGF2Dv7Ntbo2dEPFhLy4YtBJOJF8cq+tt2IY1T3p
         Dau5+Z0gy6DypMMeqTUsm55BbC+z/+yfkp4UVBfjjH7pJcnyvruiNP8MA7BlDhYjjogV
         ajJzFJ+sCZaabwXIVNE0YZpyKXTafO0IQEhvp0wAB0ISoNiDbSxRNI0so68Vzc9tEdtt
         H79S9WVzWoizN5DPcd3hwfINk3zyuZikZUbF/CcNJOAwTbk1HKTOFk7ZC6PUaEbq/uWk
         PZO+9PQRtmsIH65eYkWVbufg6mbnBKxc/3CV+Ta8m8PrwvZY/vZP9E5E5J+/ItbkEBLl
         YF+A==
X-Forwarded-Encrypted: i=1; AJvYcCXjhB6/MMRLuSjCKesncrqrK39yru7syk4cqD0XK4Flwiv0KjxtSee44aoXFLdtkzrdQJ2WUg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzeg0Tc7rJgH+DC1MJkPkV0UYjcpkBkLM9bD4lbaPA1cO8zUHNO
	77261sYvv2tLdKgoNWo3458CKxJRoiHgsY4Ww7FKcVohLGeR7xmFLCQgoBSxgHYp9b8=
X-Gm-Gg: ASbGncsCbe8f/lf1LDjt2a8nrhh8zQ5XLs4uOmYpBfC8MOkwBjry94PtGmweWp71uw/
	pub47aXDPutQHrJNUjVYHycgkmwhmWBBXIUzLMtE1T8usclDiQRB0js+6pzQJ1kggUAa1nqCGOx
	51y2cHSi3oN3/om3lbceU/Xb+c4OyT/dVbLOOFixuRwM1fgqsWMwawAfAx5ce8h3rkfN6lNkOqs
	F2wxKha39WyJYTwHoWE+5za3xGtP9lhKxodl8spcHFCf4HPmkdZgctLUxqPhSzV5DBhboKVuooV
	nlr6Nw/XBYXY0I0nNH5uoFcAVKcHQzYIZOqnmNvVadxX92SkdZn0ecjCcYOtq/SdaKYVauTfHec
	49/AWuj04yXbj288H/ZeDr+cNfh8FvB8uww==
X-Google-Smtp-Source: AGHT+IGinrr6VlQ7VPBCrVc59xWEOcpuzjncDgPBrTWdeNMpcUJW8rPWbAvhsIGRi9zIwLALwbGYCg==
X-Received: by 2002:a5d:64e4:0:b0:3ab:27f9:e4f with SMTP id ffacd0b85a97d-3b5f2e1b872mr13361758f8f.35.1752585657761;
        Tue, 15 Jul 2025 06:20:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562b54b439sm3676615e9.16.2025.07.15.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:20:57 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:20:55 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
	deller@gmx.de, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, sven@kernel.org,
	alyssa@rosenzweig.io, neal@gompa.dev,
	support.opensource@diasemi.com, duje.mihanovic@skole.hr,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 05/15] fbcon: Add necessary include statements and
 forward declarations
Message-ID: <aHZVt86l-sXKQpMI@phenom.ffwll.local>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-6-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-6-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 

On Tue, Jul 15, 2025 at 02:24:42PM +0200, Thomas Zimmermann wrote:
> Make the header self contained for including.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  include/linux/fbcon.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
> index 2382dec6d6ab..81f0e698acbf 100644
> --- a/include/linux/fbcon.h
> +++ b/include/linux/fbcon.h
> @@ -1,6 +1,13 @@
>  #ifndef _LINUX_FBCON_H
>  #define _LINUX_FBCON_H
>  
> +#include <linux/compiler_types.h>
> +
> +struct fb_blit_caps;
> +struct fb_info;
> +struct fb_var_screeninfo;
> +struct fb_videomode;
> +
>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE
>  void __init fb_console_init(void);
>  void __exit fb_console_exit(void);
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
