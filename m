Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F91415B971;
	Wed, 19 Feb 2025 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958211; cv=none; b=qWKVYhnqYwMA+lQhfDEMs2xbOaftVCpW6i5nnVGj7OD5MxuwxV8gZCX5Af2DpTT2aDoO4LxpMat5TlHlyvwfMX0Ullk1XloSaZf5ZqV46Tkp4DkpQXPnGl8rcsAS52EBv+GJ6K4zQ2pnIS2lHtswIuSqkkqoZ20Ne2qkj2WhSV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958211; c=relaxed/simple;
	bh=JbQfZE+vLsay+m41W/xExMvsph46lPBJtYHfkRyAxdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hh3pcf5buM7CrvEftLPQQIWHoNlkEAXBnIGBWGsKd6/VdIHHHKREpLBApm4YHP31BTEKX6+Ke1FzVFXH60CEdgGUFUzGQ2FzYpuAjOZo4GMKx5kCO1vfzNKBVv8PdTiFLIYBbrtCQMjljkt544F4Q08Ie+pqyWVLRSCd1flz8mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAflyevK; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAflyevK"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e5dc39ede40so4089183276.1;
        Wed, 19 Feb 2025 01:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739958209; x=1740563009; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JbQfZE+vLsay+m41W/xExMvsph46lPBJtYHfkRyAxdw=;
        b=RAflyevK1nh/Pzq2FS94vm0nYCgcET6dt/BXdZz74W9RjnZWx7CJdOV3Wq/X1PiUiD
         Q3Bds08WjOvr2jdUQCzgclMPk/BrgX+xsFSLXSm6tAfxzUHPBiY2WJtZhKqD7D8eA0ak
         xtgwyQZZRm7g0Kjyzh1xa/Y87h+8D3zlXDiHlS5KcsxrU3BJx/GIbRX2zWpSGkaMwKVS
         Ja2Glul/SnYKwsp4edNyUaEC/Nd2MEDS/qhQ/ae10U54ZQaPE5LTpJ2H0fYkZbaUHWqv
         1nnJ9O3wtJZfUr/bsoFGD/AYs9uHtvzh0FGIByP3Uugf7kwZP1oYlX0UPP4EKuXidqXZ
         zKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739958209; x=1740563009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbQfZE+vLsay+m41W/xExMvsph46lPBJtYHfkRyAxdw=;
        b=QPJ3x/fS7wWhOloX6F3Ghuc4y4C2hmtbjxHBEZumfEMOdoUBcBKC8JwX3Kwf/lHJX+
         ABjPRt2bGdbwnqT11yRaiNevcVtk6JeknFJ9/DO3CllTSyjWq03wNxKdIcWUQ/QdNH5s
         IBKPNR/uAcewEJH1vBjGVeN33xfnXn/5EXn98pOp2oOjk7GIryyQtvWoyWEfSQHbGfYu
         E4umGartrDO2cAPo4UPvZzsAndwXvTXOHLaqNQkD4s4nUtTUNilZS3A1s93uIlcoWYQ/
         qb2Y/O8Oredq4h3OWEUekEL81127dQR/vYrkBR7sZuERBThuiCTkPP2M0JyGcrXxj9Al
         wMJA==
X-Forwarded-Encrypted: i=1; AJvYcCUXVGJ9hiYGWaGbIzPz4ejgzWjFn1grL+8Pzdm7IfTRs7BmnzhT2whbR2G3AfC15326PJ06rQ==@lists.linux.dev, AJvYcCXrUIDakRZJlZDtYSYtOA2hue6oxpkrCiGpxQGpdidfhj7D/Xr7k13L7WhR38dFrsC3dk0j@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3l9NK50LL+Fg63f80bUkyB8SMc9pCtkoNVfMzIdsOzYCSUW8A
	hGWqwcjwpM9rWZEFn/+7+Mrf6SAy6Mfu+EBmufy0+T2UfenMcol2levlIaZh/edgnnpJO3kIHCg
	IwrlPcdaAJl78I6uW18+ISIx/ETY=
X-Gm-Gg: ASbGncvsLxw4smJOBYVe3eohZMfb+hoBeoeEiDMUiIlKXlt6Ms9aasB1XjccB/IdUdH
	N+mFqNicuCy1Aa9j/MK1q/dbWCWz0Wp7xsUTY6YfdHV+yOVreCtb/o7aAwbcIyQPmTmvbAfi+Nw
	==
X-Google-Smtp-Source: AGHT+IF4fhS5ToYgiyprNptli3rl/YWe/Sr8AbYoBe7Xa+PURKeBJb7TRkFTdB3HeJfB6d1BuGRjs+ziA08+lfNk/74=
X-Received: by 2002:a05:6902:1509:b0:e5b:1453:d2e4 with SMTP id
 3f1490d57ef6-e5e0a09dcb1mr2433065276.11.1739958208906; Wed, 19 Feb 2025
 01:43:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com> <20250219-isp-v1-1-6d3e89b67c31@gmail.com>
 <400d64ed-670a-4297-b43b-cdf4e8599c7b@kernel.org>
In-Reply-To: <400d64ed-670a-4297-b43b-cdf4e8599c7b@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 19 Feb 2025 10:43:17 +0100
X-Gm-Features: AWEUYZngFT_TlGtzAp7eDIc5jUmixD2xinxUmQy_lSABzD_u61AwBZNq6Cj2sCI
Message-ID: <CAMT+MTSb2gdkfCZE3i+0ah8AgE_G8mH2MFTms=QgFwd-nbA8Ag@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: power: apple,pmgr-pwrstate: Add
 force-{disable,reset} properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 10:34, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 19/02/2025 10:26, Sasha Finkelstein via B4 Relay wrote:
> > From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> >
> > Add properties to set disable/reset bits when powering down
> > certain domains
>
>
> Please explain why and what problem are you solving. This looks too
> close to SW policy or really arbitrary choice. Background would be useful.

The ISP block has some weird requirements where some of it's power domains
will not power down correctly without using the "force disable" or "force reset"
pmgr feature. Basically a hardware quirk.
