Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773422367C4
	for <asahi@lists.linux.dev>; Thu,  5 Jun 2025 13:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129912; cv=none; b=tVvS/PPeikkkqfG+5G3XJSWUXXKpJShvvk4gknlvkseY7FWlwIqc96MRr3rAaAsGNLtp6/gWE0ar8jqxO7j0c3DUeWOabIWyQwPBxgK6J01nGjxvOj126AcegcBmuu8wddL8QMA8stSzeofsyFqSL6PvsO6/HsLdDHXkFQWbw7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129912; c=relaxed/simple;
	bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmiRjBDyaXuu4sPJAQy7SbqTRCYIjWoxUaIfe9aox7l6YPmJstVDIX4Q53haJYCDP8bAnq2ypCR/iIFWat0s7omyRup7qqrkAN5uxJ1KaKYzkfB3hy34r+0SpssE1CQDrlpKZnxxHtkzRl4MJtX5FInZgk/WoxuJDKmo6eXo08c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WppPzcGu; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WppPzcGu"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55324587a53so2079571e87.0
        for <asahi@lists.linux.dev>; Thu, 05 Jun 2025 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129909; x=1749734709; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
        b=WppPzcGupn9Z4fdtZtfS+UpmMWI1/jkHWaoKxtX8yPhs9QFzIP/2MmvdlQedbIINi2
         Z7LR7sW7cko1xTUlDC+MXa32tfS6c5W/cwnL987DBmnsnXvbJUvrw7mAyftOzcblKChw
         F9P6HL1Mwtf7mCHEIiPDfhDky/1pOl92dG8njMC2q9NczSOAVXJJj9gpJ7bNERIt8dgE
         knCT4qnJXr7rixLacmMO+xLaf//o7D7jS6WABuECMrTT2CJovInIomF6tlD6wTLBFce9
         uGv/3F7+p+Er6doQJDSe4WLKs7vOdDUTdqYMz1SOYmhgKxKVs8ty6mvDuDU+btvZaZD3
         q4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129909; x=1749734709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
        b=Di8ZrjcrXINGZVZMEi3aq2I8rx1PDWb7DBw/Lpr3QHuqM5jvpiGqxWtEtj4/r3fUlA
         iAbwdTrF6kkyxyyNaIIPqyPI0C7+SZrlw3BLB9YU2ivluwzJETgdEewbVQVhdmIYdjA6
         GoHrYfVc8Q4YOAmiKTj3Bv/X8HJFzG4OF8MAs7cdD28hKMWVMOrB+axOVdI0fM5CDLDm
         z6mUWU9bF8CBffP/x8UqnSW3wBTJOP+XFXzsqNmojjqN3YHIcw6EY1ukVjmXUwBHTx3K
         wCuwRcgXNaf5AtG8p3CJGmRRNbHPQdaGVokLFgKIA2OXvz/TX9/1PxRbdlbDFv7AjBxO
         Tk6g==
X-Forwarded-Encrypted: i=1; AJvYcCVj8iJmMTBbRJVWuD+f2gFJw/X2bL8LK6R1ZW4jlrKdHRiOf/d/yVR0QBgXYLy83ut+h+0F0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoHH8u//euDcwkgEXVM/Vk0mCdWgZFnMHrLjggKbm38/aLZdnq
	dDanCrkogOl9tOJm6km1+EY7sjg9r8M1xZ62F/GAwbFzC1eahPZBYQNpj77lMggdNGGz3yCtbEc
	XlX+JwGX8My9ZRehVCws3I+fYpZUFjaExnpXAEpMrKQ==
X-Gm-Gg: ASbGncsfA63i5SmEAYE2LSCdKMrS5UTfYygYdtiFJvAMTAQT35BypqEDoYm7bJ7fiF1
	+Ltn7ns0UsNJVKKgKDP9l65Z2dnTnBPNi6KDCyufp0wCd1OcD84mPrqSvl8A6kS4AIIFwnH2fmw
	uIX3YyOttARGQ6E9K/aPeYokv5Zi8SP60pNeTGu0VR6tI=
X-Google-Smtp-Source: AGHT+IF3sXGaPyJ0XISPPhd4itJm+I/bxd4yDXWrIuh/urkZa6iB32j4QI8PHWP6SsXF9fH8sesBFbcCxG3XmlTi4jA=
X-Received: by 2002:a05:6512:2250:b0:553:2159:8716 with SMTP id
 2adb3069b0e04-5535d9382afmr1191878e87.26.1749129908619; Thu, 05 Jun 2025
 06:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-31-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-31-5d75a3711e40@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:24:56 +0200
X-Gm-Features: AX0GCFsuDOnRf8VOFhj72Sq5BRDaYd4ZYfTzaT_rcR04We-Hc_s5kA1IErejF1M
Message-ID: <CACRpkdbisyKvG20fDV9tHcipr-+en8Hj+pZtvv0512oxzYwp4w@mail.gmail.com>
Subject: Re: [PATCH v2 31/46] panel/truly-nt35521: Use refcounted allocation
 in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Robert Chiras <robert.chiras@nxp.com>, Markuss Broks <markuss.broks@gmail.com>, 
	Artur Weber <aweber.kernel@gmail.com>, Dzmitry Sankouski <dsankouski@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Janne Grunau <j@jannau.net>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 4:52=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
