Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6EC2E2EF9
	for <asahi@lists.linux.dev>; Tue, 15 Jul 2025 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585603; cv=none; b=cJCS2C/pB+ofMPaPZATFJm2AHZucoUoqY9pMJ21cMruAwOL9rKlPmU0IprHkzKs/en17iHlRHG8y8rMNqyG6B4Ocli+S+xwZWVSpduLLMX6xL8DwgQWF4uh2r5+5kN7HoKOF08FvYJg1nFubrZI8AjYQw5bsp7eqAJ505uapC+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585603; c=relaxed/simple;
	bh=pw+cz07JtKjeBD7xSPONuGdwWJN1P3DPpVEUdiOZg4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5S7sRdlyfcytTic9QbgMSmNYoCUFEcQ22/k2U28lwb9kjzZb155iCYixp0MUosgQpRDDM/O4Ye+I8RNyzq5ko/5HbWRCNCbnLLfhcCIaGEJqHs3bVzv7QzhZMlGm+dNtOSKyOHYa6XJEeJOy5EwSgMHisZ0oiO/s92Vc7AOjGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Cy5Cu42B; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Cy5Cu42B"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so4073589f8f.2
        for <asahi@lists.linux.dev>; Tue, 15 Jul 2025 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1752585600; x=1753190400; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RZNdJdvnKf8QKxgnS87V8b+rsQrk+0DHovoGkwxahd4=;
        b=Cy5Cu42Buc1W8V/xUQrzCbCCjTEqXODH0Xsy0qzk4QE+4sUFVZ1I7vYMymZE8JIxuu
         htSxUl6iHmRznUNWcjBqE4t4txHCNPAZ5S0pEI/7WYVaVpEnbSGLt9vp5KkM8S7eL4Lg
         iym0gu7LayiJQRaln/ut4J7jLnWeEpFu5QpSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585600; x=1753190400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZNdJdvnKf8QKxgnS87V8b+rsQrk+0DHovoGkwxahd4=;
        b=DKCzRPPbMsWleg3PV0B0OiEj2hMwJ8CxeddiNnBHZ9Flk021RZEv9vvAiQjfENXOAT
         YXOz+XGYAb7dcqZH4CDznV6wdnenkytxhN1eLyEYmfDG/OjNISIjxZnY7dg5tad750ja
         1P0Rh4funcbiQIWCglH4o6BzH46rh25obWYWL/nj23fVxXv4S6KNMe2+8/ruLh+vH1Z7
         n+mvmvLczF0YS70au72nwOemQ9VebU6wag3anbUo4oNkyOWby7B0Ney81z9n85Oa+3Q4
         u9iDg5cluldESzBoYcQYw/KP1r24nOa1pTd+W4mRIvO4D4F8REHn/HHQrLwSyMjmzeGg
         n7zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAc+LlbGvSuyWQMRWjcLE6XV+VXkZEfLr9ZI3FQJaLK2pOkFFayeBma7TzuRfC1NBrh9BSCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQnvgQ6l/+63xzO2DKPHZhxHtn4z0c7EPyM3UUU5gmpVIIl0Ds
	BadoR5nz8s6NIEj/gxqgfkBxR7ayvB2S3eg24ljUT4jzJz5b50qv66dQJAY4IO/5s3s=
X-Gm-Gg: ASbGncvVLmdYr/PGCm6QiQ6H04w1H8lIoVOij9xWkZW34DBTOpyJ8urm2reN2D9NxDf
	zh02+y6fv6v4i+OW5qb1LgnsZkBSFc/78maMAC3FyNMiEslIV1oUpxcQU79pth246rhW/1g8yZA
	s2Ss13gpdv01AwUzWjYVWvn6otmmHW2Q8SN78LFP4nt/sTmyFUoc8KDi1/cawlPmB08tpvZ1qZd
	Tea3U63jm6Ny36kXPMeDXgGd7G16Aw3LRrjzPU6mjfNu8dFon7PSZz4cZxChcceHMGIOljPiO1P
	nNd5J1Gzy+9B/6qFBkfZBp2iUGXgubIaHJmcFuCNiHqrjmUf6D6KCeSUmxElwAVLJ7dzDGZJvYD
	gOtW7iniek+Sepbo4c5yAYzffCBgByz7svg==
X-Google-Smtp-Source: AGHT+IGgOrGKdM3z4rYXREjB5K13TQWQc9hzSbnGlRYyUFMTZTPMvyOf/txGJ4PS42ny0/qCStlXJg==
X-Received: by 2002:a05:6000:290a:b0:3a4:f038:af74 with SMTP id ffacd0b85a97d-3b5f2e3ad53mr14816635f8f.51.1752585599669;
        Tue, 15 Jul 2025 06:19:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d70csm15389832f8f.62.2025.07.15.06.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:19:58 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:19:56 +0200
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
Subject: Re: [PATCH v2 02/15] drm/panel: panel-samsung-s6e63m0: Include
 <linux/of.h>
Message-ID: <aHZVfD9Koa-fi5CQ@phenom.ffwll.local>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-3-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 

On Tue, Jul 15, 2025 at 02:24:39PM +0200, Thomas Zimmermann wrote:
> Include <linux/of.h> to declare device_property_read_u32(). Avoids
> dependency on backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> index ea241c89593b..930948cb615f 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> @@ -16,6 +16,7 @@
>  #include <linux/export.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/media-bus-format.h>
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
