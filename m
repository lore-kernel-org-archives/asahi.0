Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A462E2EE7
	for <asahi@lists.linux.dev>; Tue, 15 Jul 2025 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585760; cv=none; b=dTgWEJjBjKj1U1EK+R31oGzCKcmcSvjk6d/bs5KTmsyKEcgxUwHdakvU6Hf+uhwFXDdy6H++d/Xt5PcukOo0h1UFRZ2gmk+IyAsRsoqVhiGbGMTCXt2R45GAWzWstExG6466N5iqW8KDbR70kiPSCyea05wdbsJOltsSaM/DsZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585760; c=relaxed/simple;
	bh=sgr6rQd/h9Lyy5OV9jWvIBZZU1Mi6s8Qpv85V1jfhy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1M75GdKQl9/LfMBFL1PdmGzng17ByiGOKJiHU6q/Z5mgbOvvFt2683U4uqj2J+ylwyIsfENSXvClTSAM227Zlq637W1cfvxTdbQ8BDl0CoQ1ItS+O9yFaKTC9m6V+14iqoYVZjqa9BEyTswz+tx7l8N3kc8BeGn2bngRXdgVww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=gsar+Zza; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="gsar+Zza"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-455b00283a5so23700645e9.0
        for <asahi@lists.linux.dev>; Tue, 15 Jul 2025 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1752585757; x=1753190557; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=61QFwRWr9Ndvk2ttgipTe3LJv9XUBOlZkiPA5AUFmfs=;
        b=gsar+ZzaaPous2HMJ0DJ0pYGdf41FsI4DCO7WHOLaLbDU+nT3zd1kwQH5BJ/0Y9mna
         OJ8+QnZbtTHibPdpbATABW8gqfbxDGqOh+/4GFVs/E/U0jflUIvrrAWUzYz48/JM1MxB
         7KK0bNcly52Ceo3CMxLHTeO0Jc3vYdYGpwvm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585757; x=1753190557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61QFwRWr9Ndvk2ttgipTe3LJv9XUBOlZkiPA5AUFmfs=;
        b=SXrLAZ5h5WrjvIafA0S+3umv939tbiSFfhHWP9iTckm6jf/yTEsNmCtCFEBBGdkD75
         smLlxOlq8tToA7LKiwhlEYkbte/yeOoqWJt0eo25RieYfrMT2+1LL1bHDxLGBuXByQMN
         2jy5Z/SsPE/7Y7PpKwAXT3SRwyzSzpqqQsCbtZdJPFmL9aIOkeqtp9X1KO1JmxbbdEwr
         ymoB42sJ05hsWsb6x2dcbreawog1Ak6KEzWM63/P3JZpXHmFN6qvbUBIvOikJbhXk/np
         PufFFWfWMItbKthJx+tP/qi7qt+5LxVKJLibtg5m2uLSCxFfXyDPQsqennNofTSq70oq
         3e1A==
X-Forwarded-Encrypted: i=1; AJvYcCWXCdTbdqsrR5kmWyR0BNL2YWCSWsx7YavdtTJhRwps+84iCJa2/aVsHDxp6qgPY8DbRz4Q5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwBF9hOxICB7VL0lHUK8U98nZYhAjboBiyCMv9WREU+zCffFky
	bB0sY574FFZ2sJZ7My33jeqXFiJ3PvY0u8ZiEUuDWF1ksBSpUX3iXe2Y1yyk7nc6gZs=
X-Gm-Gg: ASbGncvXvD5qK51LqmENdXOrplBIdUjP0NrULYPFI7WgHh26k/yfS8tD/mID7x5libQ
	+uoPh7R2FxT0h6OjPd6yMNYskmHn3YZnhgyJh9LtfOZem+Yz8TQ2fc3S+Yg+0X7x8yhLJPwKz0v
	VFmtEHDAK5+6TJ9ijmPE3iYYI/PGRn77ne4xJ47lq5hUlYfIingXmPoLaKnxzNk0cPz2fFZFB+b
	AiMZrqAPlsQ3VxCoyQK5ANfD/xiEVyYiYBlmVhBhk5+yY+RMu98WGEfogwzGeE9Jj1Bt0HnYIm8
	jGNZEPqOUtGNe5THlN00qFcSjKdJlZKYrDTOzPW/YpgXIx2ybqhhj3TA//tBz8JaCvj2bQ/6QfH
	5vPc0d9AeciFWO9sGVuJjxZqYO8jOJ4JMFw==
X-Google-Smtp-Source: AGHT+IGd8c2xyf0Uxkux0OC1AuHlKA+muy38gHZuCpdnRoCjje75nBhjsGOEghV+rD/6jvj+dlKRcA==
X-Received: by 2002:a05:600c:1911:b0:456:1121:3ad8 with SMTP id 5b1f17b1804b1-45611213e56mr119039315e9.10.1752585757203;
        Tue, 15 Jul 2025 06:22:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45624651a09sm31053395e9.12.2025.07.15.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:22:36 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:22:34 +0200
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
Subject: Re: [PATCH v2 15/15] backlight: Do not include <linux/fb.h> in
 header file
Message-ID: <aHZWGnJ9D72YFgNh@phenom.ffwll.local>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-16-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-16-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 

On Tue, Jul 15, 2025 at 02:24:52PM +0200, Thomas Zimmermann wrote:
> The backlight interfaces don't require anything from <linux/fb.h>, so
> don't include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I like this very much.

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

I guess also my Acked-by for merging the entire pile through the backlight
subsystem, that's probably the easiest path to land this all.

Cheers, Sima

> ---
>  include/linux/backlight.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 10e626db7eee..f29a9ef1052e 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -10,7 +10,6 @@
>  #define _LINUX_BACKLIGHT_H
>  
>  #include <linux/device.h>
> -#include <linux/fb.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
