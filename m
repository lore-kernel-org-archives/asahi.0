Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634081531E6
	for <asahi@lists.linux.dev>; Sat, 30 Nov 2024 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732965338; cv=none; b=nFZ+HZvUOzDMwi6zBohp9n9p1gFtnpBkSBpgESgD6v2Yv9wnZTjHcbZWJmmECHNTuNLmtaIcywP0LKHjWARZsknywybQFXYMa2iJOVbpHtSRvJGLqxy3qAwf0Wh5LGfq9y4BcpjuSYQwIanyeFLfXv1M1K5zKJ6YsvHr8OAa+/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732965338; c=relaxed/simple;
	bh=GRZDGSNeLTryaBCunqqgAa4OiK5cnsXdEP5G1X0nc1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANYxGgr5LpmbGB9pXCCKmF4f9SR+r4skKN1XwkfLzww4NWDT0e1nJ2DNL2fF4nSH/S3HaKKOnHA5e6IirVFuWSItm+X40Kei8m3YIIUEX84dhdDAP6SPDmarS88UFnvXTc1Ce575B6LOkaMPBeIcofN+7XC6IxC26VGla632T2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qk0K38UX; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qk0K38UX"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e3985aabf43so1282884276.3
        for <asahi@lists.linux.dev>; Sat, 30 Nov 2024 03:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732965336; x=1733570136; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=My+Y64elRWi2729TcRQADy3OD/AZrL+55nSA2jzZWWQ=;
        b=Qk0K38UXEHrXSaVjDaobyFGYwe6JkgBeqTZywkuKETBmktPjjNmQFLqROQtYaXvDyd
         kxWNj9yoTT+nj3DjbpLsgu2WNxQUSA+Y8cQhHEqpHmtwIDlCVA2s7VvWR++dMop8jQZ5
         PxQDx6VJocVgPhNXDZhmNO1p9GcvhZ691EXOmUxETSgEbk0HHpCgbgC4WyiMhy75FqBa
         rVdmQgGxLmDYLo5iNbWgyUIlbBDWHPX4PUlld+XaBsc2UkRfLS01lBEF8enCceBQiVxd
         g85+z6wS2mMXTCXbyQuO95Fvc6VUL+FOCzmkq1voNoHsBDcrU+qUsFCjj8xNB/vxIPHM
         BM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732965336; x=1733570136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=My+Y64elRWi2729TcRQADy3OD/AZrL+55nSA2jzZWWQ=;
        b=vNtkIJEno9Skk5hGbbIVF3CCFIP4iLsKAGis46kvr8I8meYzCj9uD8exF4nNba/sFF
         mSB/gO3RWg7SWkG6ffcZUHE3g2RpEk/Ofvh4Zyuhqk51eQ0ZeE0gyw/NglN4hJZe+fE8
         AeAWPbhbIFa+UsEbu9tVrQs1wEhiv6caLqTZt55dhFJR7I4mZFXchVDTA/bx4q0Ee5X8
         7aAnB0hrh8Zp8YH2ylrHjpmGNLGwWRQbIJqkp3ARgkTSYq3ue/gg3X7f4/5mWiWJeqD1
         w5jRCia5QBjje6Ep00Na6DZSKZAkJDaDJPdnLqTzm+mDo+JqafnLCPlf8YsE8pRLhNcj
         7t8w==
X-Forwarded-Encrypted: i=1; AJvYcCX9D5Cm1X3zidT6qYgK/Jeq0pfGJ8R3ouqTR+dGOy3EUobmm42KaSFqUZc4Km/gAZovdQ6QhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSZcu7YQoTArfd91gWFZrCrJVhvnrJn6lzojqM4qSfHmTW5y9V
	tCLzytpYcg2d5RoOeG1x3At/UhvDf0TlDV7cAInlddixydHiV3A9Iwqis1n8XhztTQi+lYOgfg2
	T7Quj+Z69ezWggI6B1QEUbZVArrg=
X-Gm-Gg: ASbGnctT9TnZxDvhUZn2C3ZPrIKBYkavSI7WFYTzn22Qp1/grgV6VFU1zsGNwY/efeA
	fTLUvn/zEEIvd8/USAwIi585XBQXjpuxy
X-Google-Smtp-Source: AGHT+IHnjY+2Sxuoh7d1Wcmkvzc3kysfXGBiGIRQr78j9FBJPnq2iZmfGEF20LZhC0dhpWjwOiR2FaJ4YhczzVfR9XY=
X-Received: by 2002:a05:6902:154a:b0:e29:1099:9047 with SMTP id
 3f1490d57ef6-e395b869ac6mr13767408276.11.1732965336132; Sat, 30 Nov 2024
 03:15:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com> <20241126-adpdrm-v2-3-c90485336c09@gmail.com>
 <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
In-Reply-To: <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Sat, 30 Nov 2024 12:15:25 +0100
Message-ID: <CAMT+MTTGtmMvbPy7HvTQ+AdF_X4dTcfXV5n=krm414MnXYqxjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm: panel: Add a panel driver for the Summit display
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Nov 2024 at 10:29, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> > +
> > +static int summit_resume(struct device *dev)
> > +{
> > +     return summit_set_brightness(dev);
>
> Doesn't the generic code already handle that for you?

Apparently not, I have commented out the pm ops, entered sleep
and the display stayed on.
