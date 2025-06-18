Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2443A2EE985
	for <asahi@lists.linux.dev>; Wed, 18 Jun 2025 15:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750259309; cv=none; b=gCg6S8DhgbC2W77qSQ7Zdei7j28h/TOT5exdn8oiQEu8npkz8tCsOxFmgxJZV+DupP/dyu7NMiZ54mw1ZUfK2hJ11/GbsRs/XYmY47Xa/GocFAscXYIXchTUfbNdAE5uKQhxiXhm/fRzDcOWXa13KvAUrzu1msxKD+HB4tKReSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750259309; c=relaxed/simple;
	bh=L8Ij7WI1ztqVYmG775JBVUJdflNviiHPGOnb2Mh/ppk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+nkwwtPOW+o/meTEn776Zq4Wq3OvFtW3oN8S+iVbWR1hWzeW3jrh36I1mtHJSr5x5RkgK/PzC9sOFM9nTFf9Im6u7emWZ0ZK5+vxDyELV3VvhcgeFlgev/h7ivCMboiGcbYi7m+ORU+yuI/MKtiF/5vZoZVOjNtX8kIdC86FQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5p0IkHA; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5p0IkHA"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2d46760950so7532947a12.3
        for <asahi@lists.linux.dev>; Wed, 18 Jun 2025 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750259307; x=1750864107; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NlXLcdl0xMjJ43b63DNA4aQ9Nj5CoTCVpP0YbONQKfs=;
        b=f5p0IkHAF8DRV9pcXKFvcmPO7WT/rZ7R8xhYs4QTxCz271WqzNPZrH7dP3gxNMI/EG
         3YoR+lcDkw41m3GfehrX2ZEtJ9+FK4tKrE44UWEWVACraKt7eQaZI/rx0QAvIw8eN6MK
         2zoZvlwfudnbA/7HIAGojBonBKZ504+TegDLmv5qVihCXN8lz/o+owEpw1rXhkVLRole
         dSLA9Y2Ohte9rtkKjHlGSztQNHHsi01ujK826wYiS92CjyHmEJc0R5gdJFGhx9iPn1LM
         ylWgxXzOtQz4lTn5X7PNjuLK+FCstWjywwRMiD65XlI1arb2nnxiZzlQw5GWZMBRHsak
         NCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750259307; x=1750864107;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NlXLcdl0xMjJ43b63DNA4aQ9Nj5CoTCVpP0YbONQKfs=;
        b=ql0WAKccI4gBYnybtCrS7lePbkJKAQj9jJQeF4PSRs39qAQdX2Gq8MWxKbzQf6ungM
         3ZYXhn/SqIUFx7ka+M+pkqhDjolpuBuyqLMWdsCF5cxnNPCLbmhyPg7PhO/7BwHDF25X
         alGJxmOHp3ZF+QEpc/8v67yTrdHRh452UohWd/6jTOB6JpXjAQTK3S6Lblrvs/pGkDNT
         DNCjTXIjXo35niVWogxvd39Po6kV7v0WPQV9jRxT7OGfTgI/bbpWdt1S+DpBgIxuj9dR
         7t3pDls9JXHYiLtv7MBcdjarQQncaXZytsdVoMXulTgwEsQ0yJK+T2iYwg44RuQQwukY
         3ZJw==
X-Forwarded-Encrypted: i=1; AJvYcCUDGJQSf1q7nx2m7jkuc8CovznZrEKcoad5OCl0lnAHnZn9/7VLc6gXYfapoHoMm+Z0Me+tsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyKZhKiQ3Y1hqLFXrCoZi2/1vON/t8OOoo2wSQjkDlRxpoDNa5
	ZYrdWiGGWqIiUuV257Dt0/340gzMWXYy9J1eoWT1bdcXRbXY8yiGgvyJ
X-Gm-Gg: ASbGncu+NErFCJyOZV7ToupGwYgkzk5QUTGqVGogex8ZV9rwbL2bEZeiKCGpNh/3A3l
	3uUd5f1+1WpG71/TVB02wydU4iGC1x3r/IWuhw8ZoFnqYCUbjB42+9A+mkNOmSiFW8HNJUkKQ8b
	wl0CeO+ugRGEC6MFxXcEPS2bcI+AfYPlDdeq8TuLFN2DK7exIH3lfOUh7TSqTEcaB1QK1dOH7Kf
	tSMZcHVA8k/bjQJkTKJ43YnH+XY7Y++92EDQkVx0QYiuJZNpro6GAtNd5TWUwIuVImQ3gHe+Tjs
	CxhyM6wTxFMESSot9o0EeP0ul/pTSh5VluYraoGlZhQVzKjGnW7v48IA+v08ugEox0DQRQ==
X-Google-Smtp-Source: AGHT+IGMfD1en+jAPfFZnyKfP/6fLNvoxSDJknXoysVlOSdS/kFg5+qkb2avdYMr18aUztSudZuFfA==
X-Received: by 2002:a17:90b:528d:b0:314:2a2e:9da9 with SMTP id 98e67ed59e1d1-3142a2e9e1cmr8449811a91.25.1750259307379;
        Wed, 18 Jun 2025 08:08:27 -0700 (PDT)
Received: from [192.168.0.123] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a22418dsm16968a91.9.2025.06.18.08.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 08:08:27 -0700 (PDT)
Message-ID: <c7ff4ca4-da9c-4b86-893b-1ffd9fb0fb4f@gmail.com>
Date: Wed, 18 Jun 2025 23:08:21 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] backlight: apple_dwi_bl: Include
 <linux/mod_devicetable.h>
Content-Language: en-MW
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io,
 neal@gompa.dev, deller@gmx.de, support.opensource@diasemi.com,
 duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20250618122436.379013-1-tzimmermann@suse.de>
 <20250618122436.379013-8-tzimmermann@suse.de>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250618122436.379013-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/6/2025 20:16, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> to declare struct of_device_id.
> Avoids dependency on backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/backlight/apple_dwi_bl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/apple_dwi_bl.c b/drivers/video/backlight/apple_dwi_bl.c
> index 93bd744972d6..ed8bf13d3f51 100644
> --- a/drivers/video/backlight/apple_dwi_bl.c
> +++ b/drivers/video/backlight/apple_dwi_bl.c
> @@ -9,6 +9,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  

Reviewed-by: Nick Chan <towinchenmi@gmail.com>
