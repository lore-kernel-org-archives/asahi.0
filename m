Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA221ACED7
	for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 21:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517255; cv=none; b=obJ6PbXEpNQOCN/3VAX0SnzVWbOEnDTs7S8tIK3Byz9OPA5bsUnXTqVZYqD0PAwoBVJ428b2U+L5JxFvoarFzUKgks5bwvmHg+aH/JhBakO3VMTyMf94LsOD8YA7vqAnq2A6nk+377GX9/7YGUefUkhspBzM60DFKfyf62FTUKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517255; c=relaxed/simple;
	bh=IdZf9OirHo3w8TLk9FbgVZ1A1snETQ0MVXnUxcN2tAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSwbxg32O4FxSDhnvF7lgalmVzp3ir8sVosDC7wHz7OGbFYLvLs+b/w4nkADlV9TtQXr5EAKeb1UqaiGHaRxtieDJEERS5cbgXXLHiTfr2EmiqREK5eiuIrbARik6p4/iV7gewTeN8R0Q+RWSpuXy+5qJSHpxVzoOR88Fnq4ETg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kelphZhW; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kelphZhW"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6f77b9e0a34so42924997b3.2
        for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 13:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740517252; x=1741122052; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aTECS3SKQyqLPvpHn3SdLnl7nJuW0BjxdhYYx7X/Yrs=;
        b=kelphZhWgDJtJgsZgwoja8n1GOnipWz5yRqK6x7HpU5dnuAu+HM0WtOgjiFhJqUDRX
         twLabNjC1u6iJNn+OCi2Yxu3b8hI7gj90/jOwWv3kAy4oDUPPnLpxRLEK3mfLFzxxKnT
         cRAo9Jn1es1Mp5naqf1hNabdOG7TkUPt9TclSf2Dj8fzt0dRryzSTgFIziYy/tNOSOol
         /dGTnVB68giW2qQUgcyzmdjIMyP7XSMhd3C7cjWokKn4WX3901F7vkEvekWlQyHMSSDj
         1JSP63Uw4e2wP+6OPSBy5sxHhsopQzMHoxWZ8VS4JFI7UcQmGe8ql7JVPyyM3KoacMwW
         hy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517252; x=1741122052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTECS3SKQyqLPvpHn3SdLnl7nJuW0BjxdhYYx7X/Yrs=;
        b=sLZHP4iH8CLxCSjYBKKNnVIZJP4bTCz1Ihjr4SN5ondVK+pacgx6fLgJSvrkMBDfeK
         kpeCuycU8azjAKkVLoX+ajvbFUQgDJWXJK7HHEZqt+lUof0HzZom5g9gzZvCsJpunlGM
         m70/UbQwvLLYyleYDkwzBBkvIypqHOai4BQjXZVdHWgbWxnfYtLfii42/hC+SuLw9r5A
         tt2IVjzGCKk+P3J9bt8d9Y6mePRM00UT2qfUigeRKm4bK/3LjxMOj7n+Dv1krAkCNFF4
         yUzQWwXhHeJC+lE6fWZYWSbwZVZvXFs6gCoHUuV5DGOJWuGXsKY8dlRe+6XAFFOx1sNT
         GNVw==
X-Forwarded-Encrypted: i=1; AJvYcCV0eMdnyChTo2UhBV3r4ksqhumsUbXeUj9dcj4pkDhdrvXHLkUcO4Elz8my6WUSIpWVaHSvdw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc5DX1oRwmR05loDi5dDiYQ+3gFCh1Q/uOJ1KGXEMmAZXDn0ps
	qukQY+CVLwWwcTSFrcmvnyx2ssNSvx1px+rywq0G6VN6sYgGFePBUGmWdfca2Ryfx/TdEuRVKbu
	BVG5peIV7DvPVq+CgTBzloxEH+ZJyFY+lQFhqmQ==
X-Gm-Gg: ASbGncvPXgRS9BjEV/fkMh/OO8qhMU/N+TEICEOUhT+Q6pxwc3SBiLXML9xq9IvMZDX
	MRK3Li4qmW8l2TLL3EvJP0YIoZkBnTCHM6VkmWWztEwMcw4URhEXrnAdIbaRJuyCfmeRcaD8uXG
	+oARGIiGy+LUA5EkfX8bxXnboWnAFoeEsVn+jL+z8=
X-Google-Smtp-Source: AGHT+IHVNAF9M985zwQc8ti2DtEeKOd6IPqcLWmaevOapLPMkqXyG9p9oh+HENqNXQGjtwqlmhkaD1MmqhA217I8byY=
X-Received: by 2002:a05:690c:888:b0:6f7:50b7:8fe0 with SMTP id
 00721157ae682-6fd21dc678cmr11826067b3.1.1740517252440; Tue, 25 Feb 2025
 13:00:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com> <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
 <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com> <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
In-Reply-To: <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Feb 2025 23:00:40 +0200
X-Gm-Features: AWEUYZnjLNgOW9D81B_b4Ug4M1LEmwU_chC0K6f10jOh7vvlfER0M0Paj99xQ-A
Message-ID: <CAA8EJpqu269ttsUcEsJpBOexRUS+pKSaMESLosC9iNCoUCtroQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display controller.
To: neil.armstrong@linaro.org
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alyssa Ross <hi@alyssa.is>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Feb 2025 at 19:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 25/02/2025 12:37, Dmitry Baryshkov wrote:
> > On Tue, 25 Feb 2025 at 12:25, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>
> >> Hi,
> >>
> >> On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
> >>> This patch series adds support for a secondary display controller
> >>> present on Apple M1/M2 chips and used to drive the display of the
> >>> "touchbar" touch panel present on those.
> >>>
> >>>
> >>
> >> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
> >>
> >> [3/5] drm: panel: Add a panel driver for the Summit display
> >>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/40115947b59f2ca361a47615304dff0a2b69a2b4
> >
> > Without the bindings?!
> >
>
> Bindings will be funneled with the rest of the ADP driver, the panel driver can be applied individually.

Okay.....



-- 
With best wishes
Dmitry
