Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A38B2E3B0D
	for <asahi@lists.linux.dev>; Wed, 18 Jun 2025 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750259081; cv=none; b=qR0tQ9CgBVTyTNH98GQuDUDK0JJ+1fFWhm7AjYlpMa+gGlmITBVfJjRFI5kiH+cWHEY3gPID8YW7ezbltFwxgn+ybGkDis4POhYM7Zy1tM2nTxZuK8uAakkpESu4AkG6C25vAA8gsE1dhFkIC5aK/Vp6Do7hazA+CgrM6PKFdcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750259081; c=relaxed/simple;
	bh=3EspRMCyRBl7yfzuy73byfYxphN1/E3jRSITGcFJFA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3o0WefkCRSDiQ3/9dbZwoEPh2/EZjDmdAGDlyBuQ/MlSSN1qtVyqRJlAPBVbUzQwlaWmDbzJLdZlTeaXC1ZefIxEPMp//sofelT5IbTXYB9TMbz1au7cX2J+JgjgWwo2Ma8dc4gsBoC8DBkb5x/9S9vGsiY3f3w4QAFnZ8jWmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VK+uc3XK; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VK+uc3XK"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c3d06de3so7949984b3a.0
        for <asahi@lists.linux.dev>; Wed, 18 Jun 2025 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750259079; x=1750863879; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Hs2SUNklx2rXkCy6cYLf3Of+XZFsviDoNS0r49LYlo=;
        b=VK+uc3XKOAT4wWqBsdUR4JtWkH+AngL2azi9vviVyhQAq34KX3pZbNgqUjr0NHg3PZ
         V+9oojpkblnAeGTCb3LkfVZZeapS4bsUXFKaEewgcn0JdlCtDqT9m3jPl6GZIQSNkDBH
         MxnCjD2No7ExGpCyOy3DG7BVMfH28vrccdHfkSMOjf6t6KJDJ3MEGT3hT/FE1IeSK0pD
         7TaJGlO1KsXAcFJ1RlwMpHtPvjssv3lYjT6ZOjwKN3zwiby/MAM2seem9wf3QBri2aMW
         ID/86xxDTDCVNnR0Sf56CoUpfz5VvtjI/9Kbua3wJqtJZJlIqHKSuJA0BQG/22WVUphq
         A8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750259079; x=1750863879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Hs2SUNklx2rXkCy6cYLf3Of+XZFsviDoNS0r49LYlo=;
        b=DLiq4Qbdk/ifhAsvXqcJov9jbXnb3ohf9r8VrhUnobbstpl0mdQ0C9rRxwFMZ/8lmT
         J9gq5hz4rRHAjPnnXNv5h92ddjdL5w3EoJYMB/oVx64pSgAwG31fPL4QUSLjpEfr3Rt5
         5tT9u/xMGJ+YTNpC0nQlfrmHTDTjf6F4fQiZ72dOqpRscWRo1U0RDce2hW9i4Pqrli1x
         zXGu7WfCrZob171okag/pngxmypMbMa+9BJClDppBLzej1uBkLBWOx0QouWRSmwGy8S/
         pm38s+6lbU5Wtz9Or0r2G1nZ8UasjHvX0R5TkZNB4xkY6yh+tkAgQUOD2Iwn4nr+65mo
         roCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4udIToEpBD3+hqTHgv+UPdhjK1Ic0bNmA0zOVJcOc2kP33kBcdj+ZsGf/uMBuXWAMBonDRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjlufPn254G6uAj8rloR3ia2kaoi18AFMEKwiUO6zdf+KCHGLT
	Y141LnDqLn+hvVwVk2o3Cyk1G41lHfV/WQC7VlCTIHjRIMbx6MRuTQ7f
X-Gm-Gg: ASbGncvdI0V5Z8anWzTkEjl4xLBrTIEjyNc7+KBu71/jdu1vGoj4FbWaTz+t9GjQmsl
	vBs+KfGD+MXLqun0Qwu1BoMp7kRZVR094Bm+lbaDmUnHgavzUgWNqQoZhcrHdYD/SgOJ6+DL7st
	BuDGRDl+BbrYVN7nUjOiqdRWDL1DwFUpJDOTUMmItgxG8bTVRkQTPSrcKSlhny0Zo6TfWUtiXQv
	+FlIcZ4/sRjn1LjwDsJYollavIcueOCH0PYzksBX6ZYnsjAb67EAIqwzgirIEDCVDWu8RlSC4oW
	sY9L2yXMBD+VCP4dfJtzlzbxLbcHjc+RWMGNYgpMH9XOad1NTDus/8zSpcmwKahlbcyedg==
X-Google-Smtp-Source: AGHT+IFbMcB+hSk5+yrphcoXGyxnzipWWHvp4gGJiBPM0m0zxo02a1BcE06EDvrBKZqeUdozbvm2Tw==
X-Received: by 2002:a05:6a00:1790:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-7489d062437mr23210895b3a.14.1750259079025;
        Wed, 18 Jun 2025 08:04:39 -0700 (PDT)
Received: from [192.168.0.123] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffecd1esm11106156b3a.25.2025.06.18.08.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 08:04:38 -0700 (PDT)
Message-ID: <f5c7dcda-d67d-4da7-9b84-a9d5a760f452@gmail.com>
Date: Wed, 18 Jun 2025 23:04:33 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] backlight: ktd2801: Include
 <linux/mod_devicetable.h>
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
 <20250618122436.379013-11-tzimmermann@suse.de>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250618122436.379013-11-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/6/2025 20:16, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> to declare struct of_device_id.
> Avoids dependency on backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/backlight/ktd2801-backlight.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/ktd2801-backlight.c b/drivers/video/backlight/ktd2801-backlight.c
> index 0489b0615ceb..17eac1b3bce4 100644
> --- a/drivers/video/backlight/ktd2801-backlight.c
> +++ b/drivers/video/backlight/ktd2801-backlight.c
> @@ -6,6 +6,7 @@
>  #include <linux/backlight.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/leds-expresswire.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  

Reviewed-by: Nick Chan <towinchenmi@gmail.com>

