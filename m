Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E4F193439
	for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732702792; cv=none; b=STOPjfL9ob4RWnos0uK73as7RZ2k7xC44idYbGprO7IOV5XONuXp8taQSTtf1eAhX+WWn9GRuTS89Kkq7KT726HnxUEYCxUV8tbicLJ08EG71fG/eaqfig2Z/urVzDiscRZQDCBTwK6/FWyLaGjCZoD2QyWImPNnQomjNoUaIPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732702792; c=relaxed/simple;
	bh=7UQTftw7QAt6/lAVbxDq9qH6ith2CFWANV32+FQ9m34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGxGdUzVr69/SWe7U3o+CsaER57ydL6EgQlD6ATAHZMsIeKzaE9Xooa+FoW92cgD6t6f9d17eS6n2Fal3OWvjNzyPGml9JmThX6mp+67ef3CByR9xTYYtuHc5kSjWEaV6YJg1biDLzBPm+2xvPgf4hrHQiOn9BbH3CHTttOg1XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVAj5KuX; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVAj5KuX"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e38866c8b2dso5823175276.2
        for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 02:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732702789; x=1733307589; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F4ZFZN9NxmPUE6vqicmzpkTPnRTjKFXzlxg+bLBGC5k=;
        b=eVAj5KuXJMnW/znNTDMv/iw9jonASD0sqaR1a8xms4u4xEksaMfaH9fK9vE95kL1N1
         PmHCm7saA850PDqglIO/DUkHlTq7IdpxV2VLih1f9vQJRe/LWgfcqP9LNREpPWGJyMED
         1Z34J+xvtDqd9fxubb2NQIj/EqyFj+yW7ItVaA3lker8oAwLKXeSmHLxjdHFwXjfLBlB
         thd4zNLGVDOIxeoy+5DK+AzACBUNPxaElNCSLzGYj3rXry8HlfVq5+QDx0CfZubwZEv5
         Z/wxtVg/sKaEe87BKISt6y5nrAdp/2gUqU3qtetTEqHrf6s9rO1m6y2R+hUtl4aDYCdC
         sGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732702789; x=1733307589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4ZFZN9NxmPUE6vqicmzpkTPnRTjKFXzlxg+bLBGC5k=;
        b=J3XCZ8AYmMFbHnElZSiWUzVwjHw8A+ZKwlBJh5qmciPuu+URbU1E/c04SxFkvvyFLH
         ooKPSZl+cEtJLyAN6N43Y5bvc0CVBXZ+C/R5scsK5cHqSr+NlUB08EOrDOElqQZa79qY
         H5tppWYpp9NCNyA+tjHd3S9fKDGFWPcY2U9+hH5nGdGH6OjZr1/UjyLihMq8ZN0XpFDS
         D/03j5ShQ+m4WlJDj6vb4QkwiyRIzRjlFvnbtZpbwnx293R1S1G8rswnmOzzCx6D2oLB
         2JvA9gbjmCNJG6cZLIfFPb/qCG75McqpvHmSAM7YVwosKzvEXuu2yRnsgWByvYqMyO6G
         DJug==
X-Forwarded-Encrypted: i=1; AJvYcCXYGJ0iCC9x4sDSqu9I1/A42szJSPPmIX3FuAU4gXUOf+6c/3HH7VAVzGeIxz2bMMbpgEbKRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsFKAiCQUw6eB30+lNK8ev/QD8ozq/APN7uDysEJNlyFAWu259
	Lgp8UihmAYjw2BNCwpahD8wZs3gXfTRVA3DVczhZzikrqRoz+gnlGktzl45o+XIZSSumBYnQXYS
	giXsnP3/v73HNTtGWYXzR+gjdBoE=
X-Gm-Gg: ASbGnctY6m6lwYwg1XmOOnVL9b+thZwfgOHEvxugkXIaADs3dYspz3VkmlqVZOqKdCX
	lJdiq5Mr7ymEAz+vk0btx5A9f+L6D+nqR
X-Google-Smtp-Source: AGHT+IEYW50AkDoUBavXeClBq8yM9JWwAWazhdC2aIw8o67QfCzF5n/O5RVYRddcvSnH0Wwfl/8Zz40gZy3rpxRED/M=
X-Received: by 2002:a05:6902:118a:b0:e30:8440:8162 with SMTP id
 3f1490d57ef6-e395b8c279fmr2534137276.28.1732702789657; Wed, 27 Nov 2024
 02:19:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
 <27amnmlm52igidlv23h3d3bvaezbdumedfkqicbtreka3llhqs@fafepduxgv43>
In-Reply-To: <27amnmlm52igidlv23h3d3bvaezbdumedfkqicbtreka3llhqs@fafepduxgv43>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 11:19:38 +0100
Message-ID: <CAMT+MTRTzPwo7QveP5Zt_4Zycu1qohe5g8srC8O8Jo+O+-wLJw@mail.gmail.com>
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 10:00, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +             dev_err(dev, "unable to get reset");
>
> Syntax is: return dev_err_probe, almost everywhere here.

Per discussion on previous version of this series, input asks
dev_err_probe to not be used.
