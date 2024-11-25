Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10532198A25
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732533869; cv=none; b=RelX1CLvMRKsbVUBXQiLX2rSH136MbRIihPhQZyay8KZ4tX8j24PD19Ng19+vbWoIVuq+E3zUUUoulbkZoNGEM9MVYvW9eKxVOWFrGqOvgpOETwv05w3dULubaOGRJXq6O87w9SQPio4e/9gi0u9tDHLE7UzaRxOApr8QbPtWcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732533869; c=relaxed/simple;
	bh=atTGdQENg6nCHWrmtf7VN4oYXAt3UDEdIH0WpKqyH3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIsEuq7jc+K+sXlFGJZLQnSeK6PxLf5/6DLMirs06W+L4XO/oihwJAm5dc18g7ip2L4oPwENdmULhZDVz76bPMAdqM6lO7YcLqhO+Im4xqDYODZ93HOrPoAxMhWz+HNHgMDo3SdSGItnnBO+YtNHFXfqUNhrlf5AsmJFdOHaEok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGmg9ene; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGmg9ene"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e3882273bdfso4575432276.0
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 03:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732533867; x=1733138667; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=atTGdQENg6nCHWrmtf7VN4oYXAt3UDEdIH0WpKqyH3M=;
        b=dGmg9eneBxayY1UQkWCqOXrH02JZ9TpRmnMml7ZKLjIbfND1Slu+6Olnm8Es8LEcsB
         nrcD7v3Nz+FZtexeylna12NieQTNAPZwpxxGK3uo6jsepfjWrwmkWwdLxsnro7dnjk9J
         KSzs4KQsGrjl0GHk1eJW6snsvbf2VI/PfZLpdSkl0Xo1e00cNE5O8AXXuR0nvxipItCg
         0vM/j0V0VZRS9LtWvIcf++xn0X/D5uq3FvD1DQMaK1cOI5XNxBanVoZ2wfa2n9RBzHna
         nNZDtwIZyOGm/2eToYpEEaCAzY16Ec6V0/+zmlaPMBXQmdlb+WjO4dajQJyBwh2lDli6
         PXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732533867; x=1733138667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atTGdQENg6nCHWrmtf7VN4oYXAt3UDEdIH0WpKqyH3M=;
        b=OONKNiWyiFUrrjK02uDk+zOPk98Q2JaoPiMQ96BrKnzyLoejMOlia7ec+c58PISjHB
         nr0J2HlXyPFL9nEseWlK7/J3py9yWo/vqg1yFTUBcSuVi7dQh1ax2ip6zK+OcreH8kuI
         60qRMHKbuqav+3pstbRGY08h5NharoT2arA9BQMkyFbAIh0stj7Mmwji66wwS+kpbLyV
         rF9b4mL6likgXFH76+XJKozQperU05DT4FDv+qq1n/nXaCdM2D2mfN5Ox0R4imcSXf4d
         bqiBAtxFkkwlKK1P+HvX7VgRye+XPuXc+N9MWWGW3m1ndQZTJG6UKXIbEJLDm7N9QTrV
         FHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn/GDGG2uNkKQEDiS3jAI+XWz0KaYV2nOyfENT5/zW26qFR0GQyKNOZVdKN7jqr2a1YBTr3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw3JqfSt2Hhnj9e5y8NI01xqIGgFoY8rvEdeR3jgoFnNJao3Bg
	RoemMYwJNe/5+CZm2QwXRC+jyPI7E6nNzY6I+uCMaVpk315hxLHmzwRS2G5S6MJHx2JDhqyrGt1
	P/KqCXHue+hO626dULezO04ezgB8=
X-Gm-Gg: ASbGncsJ7F6Xl6HH+DouwXl0Fxrwg8Z2EBTzvvq5RI/W+9x65aDpFuWnEX+/oO15hZa
	DfDlMSPia2Y6u5u52tEOIvpZRMTxEHfHH
X-Google-Smtp-Source: AGHT+IHoeHq1SaOkzoegc7LOfrsp5NCsRkFD5zT231LvZh60oKXqnaI9hhCjtdWG9vlb54GAx+il0BMwPnlOQyc601A=
X-Received: by 2002:a05:6902:2684:b0:e38:b2f3:b7ab with SMTP id
 3f1490d57ef6-e38f8b346femr11037579276.24.1732533866931; Mon, 25 Nov 2024
 03:24:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com> <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
In-Reply-To: <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 25 Nov 2024 12:24:15 +0100
Message-ID: <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: neil.armstrong@linaro.org
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> So this controller only supports a single mode ???????
>
Most likely. On all devices it is connected to a single built-in display.

Ack on all other changes, will be fixed for v2.
