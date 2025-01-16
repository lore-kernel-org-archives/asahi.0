Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37CE22CF3B
	for <asahi@lists.linux.dev>; Thu, 16 Jan 2025 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737053563; cv=none; b=IZEKEuk03N5KCsD8bYI1FHUThbviKIs21xevXI6W9rVyRcr2R4z0T6mG96oYMVfY7F2uupNdda+P93GD91JhiGwcwlX4TCVbwUs3L0cCK6S1R2sLUpVf+cWuD4AU2uzn1EUzsk7L802Qg4wQ0FZn38falnYENERErjay7h5ltCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737053563; c=relaxed/simple;
	bh=7Lj72r4CcaOQX8PHhy9Xe9ESwLBSPPds1p2rS7Lq/dM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SubrPbb6T/xQvwBb5D9fRV05mb6M/dbXYoAAhwDDUQ+nBpdTVlP8wWEFcoFmWOOiD7CJGKY1qf5k/A2oRtC8XbSw1FZpKLgHm/a7EjR9bFZ0+s6RkJ7rB9Zhc0vJfPZ80V4ypGkuojIQuSb+2vYdWXVfKxlYmWPhYYpJFvZZcTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkYiXseA; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkYiXseA"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e53537d8feeso2066467276.0
        for <asahi@lists.linux.dev>; Thu, 16 Jan 2025 10:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737053561; x=1737658361; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=epUccpjDGRE9EuJbLES1VkaNPQIRZSalTXoKeOQ8Ry8=;
        b=ZkYiXseAp49yxqo80dOka4m9wyYyfvCTuOeqNlx3EzaR5w644gRwV9YhqgHVqSajQb
         wFIemaN0EDvIKa97h1iArKQdz01Md214tKzUxsEVDheM9O6/5NWUDbDp6F98sm1ikeB5
         +nGmkZWH+dDzNk9LBVXF+yQcerIFgcem9dhm5EcMBpjZXWH9XEZN1k3xP/t63mOmCsRw
         8hr68363d+vsK3gUqMW4SUyaml4MPKei4jIeABFe31lRLox4zCddd7fFaFZkgNGhAGjE
         vcU+XZzUZsLYAnRsF6rfHvBsRD1DqdcY8lfn2QFUritQ5qbp7M0JXjfbDKXE1EJggyLZ
         1PGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737053561; x=1737658361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epUccpjDGRE9EuJbLES1VkaNPQIRZSalTXoKeOQ8Ry8=;
        b=Nu6ExMeL+SsiSt3swc/U/bW6R794NqYhVgvQx7kbDA7/JmIHX74GLQEGDJ6e8amabS
         csj34TUZQKPRoZ304r35ZcsSnYpFhZYhZUGfaMzUCv22h+r+JZ74V2ATNtceml0EIFWR
         /hC0mxhr4Y0UraQEWFFXoSIlCf5rTh02uHCCgnggcykhYTeI24ga3sxmdCHq0rS2c3rU
         urYD5AV1C0JdW6iVsSabeqy5qkCC6dv+21YtlX+7I5q1kc8qqxqcd+m1Asfw59JWgtAl
         udOcl7vrcYy9gk/vRdZG1WLgf/0S+huXWZwkY6JKY22hdBc5vPMyrweERF1ao+vn9WJh
         nBlA==
X-Forwarded-Encrypted: i=1; AJvYcCVm1BpKwr8Gqyt20I0ixbYlXh3dVHYMlWo5zXR2e6dYdCmeK1Z3wHTnw4vrTmGPddylABIxug==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPGkq6okIfJM61ONua+Me8kCtI7eghoZ/sVXzhlWRvLR2T2PEc
	Muk2s6oWvZ4LAyLwVvGzRLr+qXKrF81FmC6WkVm+EODOz3MayTQKBmT3bm6R4iveDJiOSKHov5C
	whP96NKPn+nyVd1g7e7Q8S1+HDzc=
X-Gm-Gg: ASbGncvmJG06d6aHttYJQ9mQ6WVSIxHofUX98K+nepvR3Vf/RvLQjEOivTA1RddYIGO
	Q82+rnARTGZdqxwM+fSXXzGwavImTt0ghqM7loJM=
X-Google-Smtp-Source: AGHT+IG/5CjKhXh96Nk+XB/+aMWTA4imIkKzPQiupTR0gI1gGVjVyFbBQFaeqBYVq9D6f+2cUD0dR0X8JEvKu0ia5Qg=
X-Received: by 2002:a05:6902:a09:b0:e57:31f1:9722 with SMTP id
 3f1490d57ef6-e5731f1a429mr22183513276.29.1737053560928; Thu, 16 Jan 2025
 10:52:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com> <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
In-Reply-To: <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 16 Jan 2025 19:52:30 +0100
X-Gm-Features: AbW1kvbipHKJwElTaiGLwN0S5Fv6wP5xVACM8b4oZ-wh_e88VZ8Pe5kxngHqc80
Message-ID: <CAMT+MTT+_ER+mFP1yUY+L-47-sZfNmtHUp09rqpPG174OKMJKA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jan 2025 at 11:21, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> > +     ret = drm_simple_encoder_init(drm, &adp->encoder, DRM_MODE_ENCODER_DSI);
>
> This is being deprecated, please use drm_encoder_init() /
> drmm_encoder_init() instead.

I seem to be unable to find any documentation or a mailing list post
to this effect. If you are referring to this patchset:
https://patchwork.kernel.org/project/linux-samsung-soc/patch/20200313201744.19773-3-sam@ravnborg.org/
according to my understanding, it has not been applied.
In this case, the simple encoder api provides all functionality i need,
and a replacement would just be a simple encoder, except copied and pasted
into this driver.

> > +static void adp_remove(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct drm_device *drm = dev_get_drvdata(dev);
> > +     struct adp_drv_private *adp = to_adp(drm);
> > +
> > +     adp_disable_vblank(adp);
>
> Isn't it being helped by the DRM itself? Anyway, I'd suggest moving it
> after DRM device unregistration and shutdown.

Not sure i follow, as this call disables generation of vblank interrupts,
shouldn't it be done before all drm structures are torn down, to prevent
the interrupt handler from potentially operating on objects that are in
an invalid state?
