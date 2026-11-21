Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795261965;
	b=5MtE1m+oTDcWQN3WeQ14blpYlYHX8fqXoPMO+OY/zQIJjpHmw61QAKYVepSzzjT94Lnh
	 9rT1sVf50owkGQEiLibxFOas99GhlJUObRks5uub9qmHJg97n5osOgMrvLjkazBVNT6l5
	 1fnHD+NFfKg1Zh9et4QeefRgjMvAzGmONoJxyqwsByUMZzPjaKw0rnkzCMNanw6MN+S6V
	 ww5P1g5mJAdclWyU3LBer2pxMiaqGH6cDZMQoymMdV3w4KdHzRxq2IWrAn09rRWr6xHzU
	 MsBy8hJye+pKqmF1SsE32dnPBFHhHMgNf8gxN3arcatq2p8jJBp1lhwixSbNNvqtdVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
	b=JYTewtF0BLq2VXD94otssKIVriMOCTcUhiaBEu1cQbmDKwW8NFR0YDvHfw1HAobW82r5
	 +gI1ZyuWDErPVljG3A1o5R+MkJCxBLyzODWZjUJa94bYGNUQgBmS6VvmOdIFi8iYHMUf4
	 GpXgb6Tojlslgl9pha34RIN5c2An9/jToydXPrK5HkI0y7t8ZmvM2IBxWelZ6VuBwEmhH
	 2PncS0kjuafrfvoC5xZlx08YQdhj0yDQKKYwyycjMMQ6YJE4xpYUWnnBk/NHVM3ByKQX/
	 ZHdqx6X4N3p7vyfYd6n8QqpfHKBFf0H+V/Xq2vujb1Lzrhh53S8nHy9pRBJjJupiAWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ITx4xmTZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AEC606A32C
	for <asahi@lists.linux.dev>; Sat, 21 Nov 2026 11:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39AEC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ITx4xmTZ
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso2470467d50.1
        for <asahi@lists.linux.dev>; Sat, 21 Nov 2026 03:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795261964; cv=none;
        d=google.com; s=arc-20260327;
        b=p/+MAdHeMXy1i5/faSprDI9DC2LW2C5sDnblsdx2l98lmHU6LEC0pAhleCrMfta94A
         gGPEg4feFazZaxfN2yzQddNDTPYeQm006VjXAn4syFFTScFKMGWfopofuah1E35QIkqw
         WFsVQQFamuyLueACvH4rfwJJ7BWL30ZnRiUNbUtM9oZV0YpCpeCBxlvXw+mFJCx3+fQQ
         sxpG1Pxhl3Q1eGeeGdjmnhX6aNiWIBdIkgClxOAJMiUv3uQ8km5F/pRubOIFz5W5jNVg
         kYtgNcDB0EGg1pLHFUJgnjgid2GqCDqZxWIpzzDEIovA4YqqfK1gwoy6NjDDBgzqp1WU
         r+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
        fh=30kNPHGmS75l6L2xMO8rbnMznK2RbAK7yVUcC2kRmIM=;
        b=DPn6oawmVph51pqIknbhK86hJeT1Vh45fN5ldzIYFlSirRvaoakEanJW2JMEqMJgQD
         IgznVKZkjF3KuVwE2qHkQXuOefsKltDGwbSx3KKoz6qXqbYWhUN3nZQZGm8PIIgi9EP9
         EYAXKVGkwELinkPCSzYFIyf7xS/VYpbIzl6mHSvwgSSZUUsYLurrONqFKJT8OzGHIU1v
         i6sDyZJKHXbZykAsHJ0sRCmrYmOYU08oQ+vg0adpzWldVF7ch0s+5vXnBlqZmto98N3l
         iujA8eXLCiOvRYXLb3s4LEJtWnxnvdN1KfGsvS6L7x6gls9Gg4tnJLt9LpBk4OV2hfT7
         t8xw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795261964; x=1795866764; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
        b=ITx4xmTZVRWezHzUEHgomJFj9r9i+2CoYWE3JVtGQnYqMdOLh6VOODOGI0hLfcNcKY
         UAAB5+x8bTYg3JLX94FTroVn562dvFM7xXg3mtDPpbFhsNjPWmtzuNl3IH04d0hX0nzv
         oNFYEQ6JsD19r50VMKdqmoLPZzCY1z2jWcttsHfKbq5Ux/yE2cqYSH5zf2CWhA/e4otb
         7s6EdzKFeN1fGUeYm6qVj3xt9T/S215os6icMY8Q9i+vX2t/Fu7gkhtIprgPAzdPWidp
         JILkaMKGavNDBXuRgqewJ7qY3xJokErpxodsO809i+TQx7cYB7zaLGOPw9Bz25+h9fyx
         hJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261964; x=1795866764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
        b=TEuKcsZM3XVVTKaQKYFcd8sziobQ+UX2eRkvhVB4Dl8pDBMuegT3KMTmjsGX+2qXln
         coPoFixMk7pKHAb1PivjwRg07LaSaA/lEFCd4FYkO+vuDUT/k/oPFvUHVk/wgzMA9Uq1
         VDgnmBX331J25idGU7zVGqReryezf+ztFIh2oIcSLi7XAaWOSfqZJICFo0NBQ//jxt2s
         DzIalohwCk8lnjHMCbSGr5YemXWZEIy1Bf41Of7gERuj1/B1a5SD5ZFQKljpeTT/4ZOh
         TvkAbW4IcpSKpyDoHZuMPrp3yG313CP7CNNm9uCKs7Pl3RLkKbSmFMy/1ARyoyXJgx5a
         y3XQ==
X-Forwarded-Encrypted: i=1; AL+hErHy+1X/j3wTJ9e1LH9I2ve7A+Cth/nqqgP4b848GpEbCcaRi+lO0sOCLav/0OEYDIthAOPUKA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9MgRD3dfIvWzQ6RDLvZHlxFKkz8VZltyCAOJ82zRSXD+vYAuff
	X3xuIV1yGAqktmuAwayZkZKBvfqyE0DfQK5K8b041SxSPTl7rBjAPsvd3EKYMTuO2OIWjrrjrX/
	4SoBtwGA8DGwnEIAj1OwP8SaRK0zPT+o=
X-Gm-Gg: AZFdTZcinRicmosOs2/dptlJ0EDharLKL+DJ4xqA+BinYmAwZwa3E91G3Rj7gzxiSU4
	D30gqFckjPa3QtuLyRacun59iitofxOZOmAIr7GPl16j89ovVyxyKWPqM7UV7FHySdMBKuOoiMW
	maM919dPUuB02TQ7hdQe1kuBNdZO/j4MB0osNprxWoXjLJ3wzy0aL2OLiyskEQhxgdrIGUfSeFM
	wLLk0HKg2v+EXb9pPtrb7Lqk0s0kIm9KY6w6UuZwVckt2VX0XR7YXVH5Ftfm5vCodh9h2uuPI7/
	kZSWl7nfSTjIt5HEluVFkY3nGNPpZiahvkh5EBDRU0dk+5dNDnuHYgwuiGWTawZlYDICoGRd8s2
	V5m+QeLYI/9+0NOZTgXJqfK9Awnm22fJEpNK2/4bWI2gA6WPK6yxW+XvrETWJ127BB6j/mj+L4A
	O6CutTA1BEOl1YHrdWm6lPrO0iWFo=
X-Received: by 2002:a05:690e:4850:b0:67d:ab84:3bc9 with SMTP id
 956f58d0204a3-67df42c4011mr1425040d50.5.1795261964144; Sat, 21 Nov 2026
 03:52:44 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com> <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com>
In-Reply-To: <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sat, 21 Nov 2026 22:52:33 +1100
X-Gm-Features: Aa3M54rZGK9MVhmV7coDk48If11yJyzjN2A4aBmkg_LQalyda1z1hSvlbjbiJKY
Message-ID: <CANpmGNvd3Bnv58BQX3UcX5eOip5Q0DfmPhvPp_9DGRQQUWOqQg@mail.gmail.com>
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
On Sat, Nov 21, 2026 at 10:44=E2=80=AFPM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>                 cpu_p14: cpu@10204 {
> @@ -272,6 +314,8 @@ cpu_p14: cpu@10204 {
>                         d-cache-size =3D <0x20000>;
>                         i-cache-size =3D <0x30000>;
>                         next-level-cache =3D <&l2_cache_2>;
> +                       operating-points-v2 =3D <&everest_opp>;
> +                       performance-domains =3D <&cpufreq_p1>;
>                 };
>
>                 cpu_p15: cpu@10205 {
> @@ -284,6 +328,8 @@ cpu_p15: cpu@10205 {
>                         d-cache-size =3D <0x20000>;
>                         i-cache-size =3D <0x30000>;
>                         next-level-cache =3D <&l2_cache_2>;
> +                       operating-points-v2 =3D <&everest_opp>;
> +                       performance-domains =3D <&cpufreq_p1>;
>                 };

Oops, I accidentally forgot the capacity-dmips-mhz for these ones.
It's just 1024 like all the others. Can you apply that when picking
this up, or would you prefer I send v2?

Thanks,
Michael
