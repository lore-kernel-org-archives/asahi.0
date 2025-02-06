Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565301FCCE4
	for <asahi@lists.linux.dev>; Thu,  6 Feb 2025 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833898; cv=none; b=l+PjiZrG0kX7e6kTptQCrH0Y84Jorr6R4Ac0acaF/OZyLWaMBbGjkr9sXzX6b/UkOet4SaaTaTZIWE0xenff6YuXFomaV2UBIf7tuJA1iQYxTR9RekdwdrN0mdt0yqYCYC+FapZu8XSqUZb7W9LLjYvxHQGdTNhmqzjpwUyQKIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833898; c=relaxed/simple;
	bh=R0Aj8VkeJ1ljtNruUSkipfngsktgaMJyC1xm5s9bvks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4Dq+3u0z9zzoDaZiInfqDAPW16InSgnn49ZjIlYbOMtu/3XOIetYP+2RChUOd52D2Kqcw6vX3soQSUkeJ1B0dO4DE0PYrPK7q+Q/em872o5F+WGxDxtGpp0MDAvcJfR3gS3LZy7dwaOUdfoNxrMAyVQNtOJbTMhyq2QHMmROt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBp5FG7b; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBp5FG7b"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e58a7e02514so587990276.1
        for <asahi@lists.linux.dev>; Thu, 06 Feb 2025 01:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738833894; x=1739438694; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0Aj8VkeJ1ljtNruUSkipfngsktgaMJyC1xm5s9bvks=;
        b=OBp5FG7bMOy2Rxi2/E4FSI60iakH5IBqLiRqISPwCtxYbMpfYBche8ApjFBRF8mICc
         XdxBszl1W6uNImeiL8hBSGJug9zfmnlLKVJo8iQcat8Wq5HVa5RWjx2hmtoSlIO8Ritj
         UXYOxVMpYI1cm0jPMtdHwR+XeVRiWk23scPVnDkm1BveLFKQZX5U4NWUL8qIhQrob1z4
         DbO5zcrjFL8Vyv+yS7vVkfVxgAo1i31NI4AgageyN+lprF/AYgYVI84BwDbth+TsHs0D
         55RTq80erIn0hAKNwnkPSKd8tHwv3g0MnAd7D/mZN0i0o3n1CzG09YdkfWw50WAZIIrr
         W+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738833894; x=1739438694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0Aj8VkeJ1ljtNruUSkipfngsktgaMJyC1xm5s9bvks=;
        b=K97xjgFsI1oO8JWN4ifx78l6aWRBC5cdrOxR/1ZUB4gJhGbHO4CfQjrm6BFyr+T8sS
         hcDM5xxqfHo7n/CP/6ujvUWLFQPOhKZVKp58EkU7/KDhQF/Z0ixom1YRAi+7/iTQQYBu
         CAH4tR3Mxm6qiwyOEWNzNJ3a7j0S9yEWWTv1nYS6HMO18xjtD0pdM31K7LKoC6B0wv10
         2pBgiOAQnt15R7N6fY5J+ybukcK5OeWX9BbSAnTrGcg9UuDOaGnNaRr2UO+gLbD2THrT
         IqbpZHtNxLYPaezTTdSlotJju66ebk+e8lqFZVKAUuFuLXKjz/ixouDXvsCf1fGD0Mah
         PAUA==
X-Forwarded-Encrypted: i=1; AJvYcCWgO6AgdkLaJ6XZJmvMptwXV5J+AfLU9fqymrTHuMXgSHvMQ4RnSvXCDJSyvdbcoN3Ox21AJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGpcJUFIJTHAmTwpR5/qkJQH4Yra9PJSRxUFBjgyFztgEVADTt
	C73AgOkDCdEn4Zzxz04Pa5dJfCOgE/FIgTYSBrDBL2MG98J5+dY2ASaVsLK6S5MSOJV3Q/6XwM+
	RoZmEJ+Q1IuFVAzfi+vkxHRR8hec=
X-Gm-Gg: ASbGnctMNB6iCUq4jxqFRijL2huy8csldbdBOc4aK91KoVYcPXfnzJryX8qAYxqwEMR
	7r6xpumC7g2UiwVIJ0SpTUyiB2pV2QulL3BzaDwa1UWI8sWWKYb3CqrVFzn8cQLxdR6LGdTr3Xg
	==
X-Google-Smtp-Source: AGHT+IFbC6DM3fJVG17MrSGBXdIfeROMfW7VK5TSEM0p/SsdBlf6NEx0KbnND2bApOZ90AM+CmqzpnxiCUvcGg1/hdc=
X-Received: by 2002:a05:6902:2843:b0:e5a:e604:78df with SMTP id
 3f1490d57ef6-e5b25b95544mr4817982276.17.1738833894216; Thu, 06 Feb 2025
 01:24:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com> <20250205-adpdrm-v5-5-4e4ec979bbf2@gmail.com>
 <20250206-caped-premium-squid-595ecd@houat>
In-Reply-To: <20250206-caped-premium-squid-595ecd@houat>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 6 Feb 2025 10:24:43 +0100
X-Gm-Features: AWEUYZn9JAn4vxk91DxbpJulbYrsp1RnWuViBY7aesXFIweT5vWahzqXS6ccsNo
Message-ID: <CAMT+MTQBSuWCz0T13RkhyJLwV7tuk4_BmVH6vACFOYx=msc09Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 10:17, Maxime Ripard <mripard@kernel.org> wrote:
> Sorry to figure it out that late, but how do you plan on maintaining it?
> Where will the patches go through, and who will you send PR to?

Downstream development is done via the https://github.com/AsahiLinux/linux/
repo, then send patches to ml. Not sure if i want to send PR personally,
it will probably go via one of the drm trees or via asahi-soc.
