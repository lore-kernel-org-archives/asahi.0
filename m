Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DA32376E4
	for <asahi@lists.linux.dev>; Mon,  3 Mar 2025 16:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019850; cv=none; b=cqnhjUq4ZTtYUWtdNZfHr74vw2jIqMP9m2tEUBOnHv0ccUjFV8dYuLu1yDhtKCtUt/H07erQxCNcT2n6+g1Gv1MOdFINghpxH9WFYwySVVnrKDfZA1NxcvhazWHVVBMFwPuKTSvK1S/0FCcNH1/RtIG3Cge1yvNuSwAO8TKUSCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019850; c=relaxed/simple;
	bh=2xP1VNckQ2vULtbhOREqEVD3q8xkOcQG3iR8jMeveYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwMBARzbz4vMG0lGAgTghX4ye3MwFFo/XNlKHF5SNqho8jpynlzw1QVlbs902mFk5JMwTViyPdGS2A6eI0mC7bzATQSs6+AJJKFBz9K/UyGqldRLh7YMmfiw6ls7XxfKrQZ2SC4o+KdXV6/pl9NMsW8B9OvxVAZM8YhUPGa9hhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzugNjmB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzugNjmB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386D5C4CEE9
	for <asahi@lists.linux.dev>; Mon,  3 Mar 2025 16:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741019850;
	bh=2xP1VNckQ2vULtbhOREqEVD3q8xkOcQG3iR8jMeveYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JzugNjmB6+Sf/dusRt5fDnVooJlQ0gk4B4/Kjro31zYbH+GW18PBym7it18/y/woV
	 r5nKxsE3oayZkZ+4y1h0yhEX5KPXRPgdG/GVdMkPO6WVPDncCTsYExSKrEfNKatads
	 GFTJzo1CJPASgZpQWfwXzN1zjI1xh0JYYkWIS+hFYKgB5trllvAbt8Uu7VeBUYEPD1
	 paOuY0ay34eXjk/MjcUqv0ybymhfdiUM1r3kVlSP2DHuHUtkgVkl9antvRft7yjrIT
	 baCzkHvDUGppLEuhrM0TQwfUpjxJWTGOA8NNWXo6/LQ2+Cqd2tU6nDjIoR0m5DExKV
	 2DLBGdJqqlQVg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e50de0b5easo3226973a12.3
        for <asahi@lists.linux.dev>; Mon, 03 Mar 2025 08:37:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnMYpDS2mFD26UcvQ6hjKpL3BX2GPSo2YmYqn0WhLzPS204prGXBjEoMmoOaadRn5I/KycEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxscsI8MDbz/UI5OEKCJgcT+5g4u2TR97BydpB3NoTjqElQh1Jc
	NrnmWurAiX8rSrbQsFVCGSvBQCp0sSYSmC/FIaqOrENiUYe8DIy2Rdmq5V57ZhWEuSyZSTxp7qf
	JNtdN5+aZgbQsyQyOEhYWtkQUqg==
X-Google-Smtp-Source: AGHT+IHUsZAUSMpJRbmPIa6fiiDfbENTCpBzluX0zXK2ogy8xG9qRfPLy2SEI9L4RS00s4IFwPqdkKyO7j94lM74OL0=
X-Received: by 2002:a17:907:7f1f:b0:ac1:dde7:a80b with SMTP id
 a640c23a62f3a-ac1dde7ab19mr235932466b.43.1741019848769; Mon, 03 Mar 2025
 08:37:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com> <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
 <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com> <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
In-Reply-To: <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Mar 2025 10:37:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKXguOAK2pge-TwH4M8JC3UnEi_ia_7QjrgE_6KZzGucg@mail.gmail.com>
X-Gm-Features: AQ5f1JqXNkmMvtXvWaBKtRXTZitqf2vltXXW5gy5b2hrxmHRwoqFlvx_mv3N5EI
Message-ID: <CAL_JsqKXguOAK2pge-TwH4M8JC3UnEi_ia_7QjrgE_6KZzGucg@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display controller.
To: neil.armstrong@linaro.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alyssa Ross <hi@alyssa.is>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 11:59=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 25/02/2025 12:37, Dmitry Baryshkov wrote:
> > On Tue, 25 Feb 2025 at 12:25, Neil Armstrong <neil.armstrong@linaro.org=
> wrote:
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
> >> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git =
(drm-misc-next)
> >>
> >> [3/5] drm: panel: Add a panel driver for the Summit display
> >>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4011594=
7b59f2ca361a47615304dff0a2b69a2b4
> >
> > Without the bindings?!
> >
>
> Bindings will be funneled with the rest of the ADP driver, the panel driv=
er can be applied individually.

Uh, no. The bindings go with the user. Now 'make dt_compatible_check'
reports apple,summit is not documented.

Rob
