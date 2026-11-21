Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795263091;
	b=O4WTGdsbKxyh+bntz/zReLg33ipkyFzb3wPKJ/qW78ExZFFrZbwc7P2tjLn1iMQtBAg6
	 Iksx8lNZ00zoGou+PovApembWkuOnIYlFh0sFKs0v80qRmedVHXTVGR6GLcLtZFd9y+uM
	 4FVLnAGwtoE4zz/vWeYEyYHSDZeVKDXhZAGbdv2w6FZprKE+Z+Qu3uztpM8Hiua3uv1O7
	 maTr5KpOgikop1T2rDgQ7xo7T1vMy4LVhbDEJyNtDlAdQwoVESBtLK19zDvQufbMcbTKU
	 Ze/pLer/ghFKac8VH7DabLVGObStX0uIgiBgmQQ7AVH/BKavQG1feoOAAm4Z/7GV6AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795263091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
	b=1J7GoE0HvLaHwYSnuMLAMNdFg6WsD7DVGiHSoQMwlxzt1EIbZKWDnIOzIkgx6B2LP0L3
	 dX3dUKI7PGdkstusMqNqntvtziJQaimFDooNj1iPXh+lyoBOTepnqu7w8sbJjFvvT1kff
	 9NuYSUMymXs2oB5V1jTuEseSjTv2ps9m7MTP9U+gUBrNyxRC6EOXAr7o6FlAyq+H8ziuf
	 Rl3CFf3z3uRFb7+1TB8+priDtbUnw+9/Dc0A0ySQv3+2EOXAPHKwdaXbEZ/AXCJa5FbLN
	 ZQMhrTX2RUnPrx4Y+Yc14XVTuol0EXZnMLop5Z/7nY9kJ/9eCJ6jNMGiN7ASq2vTSnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="snpqDc/U";
	arc=fail smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F8F606A32A
	for <asahi@lists.linux.dev>; Sat, 21 Nov 2026 12:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F8F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snpqDc/U
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67db35e7953so1955587d50.0
        for <asahi@lists.linux.dev>; Sat, 21 Nov 2026 04:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795263090; cv=none;
        d=google.com; s=arc-20260327;
        b=qdjiGp97U6PgweN5ckPLPzCk2qP37W9oxSYYvESXQZFbcJYBV/Yf7vOvzuEE8ivaK6
         6KV/BftCTWyHndwT+rd9OcQzlDOCuLExLG3P/bZbMOtvbKKDOYULRKxIXKoOFcQ1v8YR
         8jp39DpPs/liKMUbQJSjhYF8TwaQdnRYQ56s1tttHxVGFnVrkN3nD+vj7xanh8onQd3n
         pDhouQMu1l5wzDgsRLxjARUxd9xgqSQuJ96bXodNCBz7EKkYSEHbvLjZVGLEpT2zP82Y
         nYAOosjek5mEDqP8ci0tPSAGPT13Zezg2ltxjsWJTg9hNeckj0iz3fiwcj/RU6GU3Uif
         yePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
        fh=fh057yQ6aons0dCPWTXjTWikF7gVxqfVEae8k7n7yVM=;
        b=n74xnqGlSdVL5IHM5nR/9G3ArIzjxDR9++thO+FqJDiChdkCY73DRI9MWdeUTzipen
         0m0y2WDOysFGB1aa1ri92nJlGEgUR6ghFokzA3lzMqHsuZGcwcg+blYI2X3gC9kveAV4
         Bun8lkg8vD4Vc6EIYbXOM+weZ1sTpva5fMM2DLGq/N2AqJ3DeeF3Ufbz8gNGa5TjFsGd
         wbNZ6QphvICPC4dFUvSvY66ES+ycEUHeMUvwlb53wz7S6BVAU2D6+KFAi2d3k3YDbp2G
         ybrqnMprmg2OFrnUMwmsx3iQQtsj6jMU93aIngA4BiPhlM+0T+sqm1LbPE6/YLEmGeCp
         Hy8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795263090; x=1795867890; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
        b=snpqDc/UKiV1fzj5aiGibKcvQDOGKqUNOEJ+pCH0Hyhm2XuWqZL3oGcKqJwg6pnwso
         hSFrsScDkIs0nT3DETN9m21JUVV9SA9Cnx0peFhgax36y1kGxAD1E3+tJwKk9qzt3+HG
         agdu1VoSqAYvfPH5mSNmQt4A5q2mUrtBl+LRioYY6tPbOZlgVkSgyz1/5P1tTygpR5HZ
         amEo5RSU33/hrXeRQoETrlkNxluA081IknO5w5+Uk/EKHhTYAWHEtVRB6ACX+F4nBfrB
         WaDqlLQIiqpTA7N4XfZZbJ13bLicSArSeCKYq9hIqMmo64lwpMNnWGn2kak9bYbMOOap
         WIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795263090; x=1795867890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
        b=yQu6UN6jCdNIWHEiq3FugIMRVV1WvGtaF77lbSSW4FhSvzjaaJpibmrrfb2jDiVCPh
         EOLXGk/i1uRdGw/6jyVyQQ6LmwVnePxoEogT+ecTmqWKS60h9wYjiRGzRRKHSZBo7uGD
         jAjMHCrHaLt4gUGb5HQA8u71pGXJMWbu0GlD2J3rxGzS7VuZ/M/rupG4/eGPMMDrZitE
         Du1Ts28y6E1ZnKz8UX7lWi6hpxNp1ZR+IGEkbTFQKvhA9f5+Evob2k5rcFiGySJeKZKS
         DR6gDuNVvLcco19FP8OVtZwoWWnv9RnQWZ6r45n6bORVx4egBGqjqT1XyQR9Op9YX+H7
         WMnA==
X-Forwarded-Encrypted: i=1; AL+hErG286uUx6YJ9C5gvKEy9qLPe1anUurzoMgG6svHTNI7RKdUId9d0s9g453uZxkI8RyShsPL9Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9UQZHUloTLvJ2MkND8rRdxy4tGJw8Zzmg/R8Ih7yL7/9CvU3A7
	MM22/EW2IPO+A/ecotcoIjv74WP7cv2TOh3Ru41lqXRUVdI9j6bgD/7zMHzYyHbTC1cwR/n7QbU
	4j4tWIhIXRg3i8EN0PQUVEVB70CRfdoo=
X-Gm-Gg: AZFdTZeHGoqMBjCuxnjXbloNnFE+v1voaH+P7V8OjYRjlDrR4bFPi8e7IrAmnQOYZg0
	hBMbSnbUKw5u9OFvDfYVezSnS3LKu4ZE9oLyl2m5FslARUDXRQU4BTjo5TiWr2cEAci7bzjDGJq
	86qRX+IhKpak8uGKYC81IJ6KybGWm4TBE7Pdh/fgLHjM75Bc78knjIqAXgEb2okfZNJTUI5AkSG
	yEiEYZfPBZFmt0aVVxo/HkB+RfuYCBCQi6EFyXetCEdXShzonz65j8/m61VDAWZkUgoZuJPog3T
	G41DZBczho6bIctGosBGNFIlnsfyCzp+o8qF9NIjoqLWKy66lsZzucmBYEAMNLGsNv6msEeo49E
	mvkaN23LByG/t/Dw0se1eg7Ot4Naxv4WtdgzJmI5oMRR7fUctVeC7YCDMe8Nr8qHoN/5b+HZEQF
	7KArSrEDYKt5G0GUfU5Q1ESSUOGQ==
X-Received: by 2002:a05:690c:61c4:b0:8b3:5fd6:a544 with SMTP id
 00721157ae682-8b52047e1c1mr19674487b3.58.1795263089936; Sat, 21 Nov 2026
 04:11:29 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>
 <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com> <CANpmGNvd3Bnv58BQX3UcX5eOip5Q0DfmPhvPp_9DGRQQUWOqQg@mail.gmail.com>
In-Reply-To: <CANpmGNvd3Bnv58BQX3UcX5eOip5Q0DfmPhvPp_9DGRQQUWOqQg@mail.gmail.com>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sat, 21 Nov 2026 23:11:18 +1100
X-Gm-Features: Aa3M54osrg6doytRUFLjK8s5YltogEr6ZngrwFO8UHAiCYiFQIm7-VCyERe-Cqo
Message-ID: <CANpmGNtfmk8QODQf9x7nkVSr8F+=8Hfh8GbKjCOnxvw3PXCTFw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: apple: t6031: Add CPU frequency scaling
 and OPPs
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yureka Lilian <yureka@cyberchaos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
On Sat, Nov 21, 2026 at 10:52=E2=80=AFPM Michael Reeves
<michael.reeves077@gmail.com> wrote:
> Oops, I accidentally forgot the capacity-dmips-mhz for these ones.
> It's just 1024 like all the others. Can you apply that when picking
> this up, or would you prefer I send v2?

To fix this and add proper T6032 die1 support (as suggested by Janne
in response to the cover) I will be sending a v2 shortly.

Thanks,
Michael
