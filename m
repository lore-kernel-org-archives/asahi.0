Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C527FD70
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916057; cv=none; b=ezXDYN+V0lHQrYcP1uAUTJVUyZ5Q5FVos6mnUPtdtyhJXbQdIfC2Ba9t0gc2WC8YOsAJQy3zytEHFC9nEMypJG9uLUVBdGVIwgmkEwFSN9WaEY2+AG4NmGILXmKFbm6XSjQnIu6t4PY3ARVtMZX3wDIWI2gmcsgrTmJ3Cxzmm/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916057; c=relaxed/simple;
	bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhTIIafaMccgihbAIq1ZcouR4SBi7EQ+df9UqX04X3SbUSpw0K+td1A8u9LZ7t1sJaL4Tpxpc8VM9zhN+ppvvE03M78CcC294cPISPf1L8gRW+S4hOdbyM3VQSpHWK5rxcbyA50aL6wATZ11MxGQ/SkHA2TjTy6pAK2to/aFYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ttrSkmC/; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ttrSkmC/"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso54266271fa.0
        for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916052; x=1746520852; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=ttrSkmC/spoOcIS+tBlQgx2imhr4JE/4d82uPIzuJvH3EiZcCw9RPvSPVs6eGTXbdb
         NXqOLGj3e9fwY/zREAKHSdmTCEqClzMLmWOvGIul3qnKuQDnQbfAuhtzSMHC7GODjLIX
         OWcfh5Z4wYCF6WqkeHxi6bIfDHAYhuF2Xr7H/D3jfAeMtqz82WTUpvAV2lNwH6RI/5Qr
         ho3u/R4B29jtHwUzqTKG2nhhXnwLflxX1NF6htV4uSrZF83b1Bvfmb7CPxCIMx9JMAqD
         2dYxOPwi1gOfx8F2MN1ONqPRsYgNcElznopGaBHcav2CyU+p1ooO+XNETY8Bn4MA1j53
         DLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916052; x=1746520852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=ugX1GG1fNaQzINt0ORiTezOM5Nk+y1jTkppyhZhOYQIFLoDm7eApo2azWfUdLd8Xni
         XegQ+uVJDBWeI9r/I8Ai6xegS7OcFaybttMQ1o4YX3sk7HM3ZW8eCQpgGgekGxgjV6Oh
         Q4Fu+HR4u3PEaMMApYu0WT/tKMCrMTGaQsLsLqAY5iugUXtgaqBWsPsTbbrLwevmoGAP
         lTZ5aF6DHbXwCWm0UCkk6nrm108jPFjigYNAHv74emSpOe3gbSzae3eLh2nMONXXnF10
         YaHc+Z9iwECWXGXIe6Jy23b73cOtoXMfGLyrHB+PzIhwwSiQoE1Sss0VB1URiXmeUKYM
         8sYA==
X-Forwarded-Encrypted: i=1; AJvYcCUDNkFjKdyroiVmzRnzKBGI3cqRWCNhPqkzSott2hQ4cXqReqEyRr6XtN+3qvy9VK4QAfXUqA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yye/+ty9Gus/Jy3rD5M9/LAof6jvH5Ha4LJK3/JiF9IXfw2tk1m
	hOM7ylxSg9Y5Gw+WifHAVAv3ohzerxM8lOOLXq7uo4eGy6MxAyl4D4JNmZVk1avTA3YHPV8NIgy
	Dq+hbCn2CpYoL03iVP+DzI41IZ6Loupe4A9rdPA==
X-Gm-Gg: ASbGncsjW2JZ3EYre/RQfNn0HGxEGwTBePTn5MWpePwACRM7MtkcuTZUi1PqCGYtiBB
	PTKgncA2WoUCSd/PeIFQbnBxzOQXZ4ZgnaWZK3Z/y7nQrzEvq34rhh0D4ibEYFQ3G/fPuyJvYGQ
	b8UvnXmjZ3Q4Fg43wxxnudiw==
X-Google-Smtp-Source: AGHT+IEUiqYB296CVrwZ+xxBw7BC+pTcJa/x+6Bu5GNB2EvNhnBwa7BLSUJNRUMp+Ehtf1mLBoE9JSmzpMhMYJBukms=
X-Received: by 2002:a2e:bc0b:0:b0:30d:894a:a538 with SMTP id
 38308e7fff4ca-31d34b6c243mr8766341fa.21.1745916052135; Tue, 29 Apr 2025
 01:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:40:41 +0200
X-Gm-Features: ATxdqUEhPh2HxY_cKMawBJnfuogL8n7jPhFvg8U9jTR5km8hYrNkb1VPdIYXtGQ
Message-ID: <CACRpkdZt8zem0hFUiq3-Z1feNZHRh3R=Y0cEtK=pVt=bJ9Qf1g@mail.gmail.com>
Subject: Re: [PATCH v2 15/34] drm/mcde: convert to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 9:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
