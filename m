Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795209664;
	b=kZ1MG6EkUVpwdGJweSKxhdLqqTTpOJfh91X0bzGaaTBo9G8MTEM0zMJum4F2OpMadeKt
	 Behq5eedzN2Oj+gWQmiwok+keeX3tbNB93Js2KkPOnshd5FhIHaHD5MsuMdpaJNkaVRY9
	 FMH9cnkP5vfbW8viKyQyUcIhQdyvjO3/QdXqGPl7yatbo85oPot3M+lHSXquT5KK8BEBo
	 LjhHPRQH890I6bezHmd9EEDs1YhuFBItt/QNUlO58AQvplfYf+xwoA8wFDnV/TiF92jft
	 3gEnbY0XqJfPwK5uvkrnYymjSC7wPlSj4TLmrzfF34AksTAtxOG9dZq5LugbBihzqGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/bp17v/3ZHhsoQMU6nx2J6BcLDJx76v/oDq4/FAEwGw=;
	b=i8XmACNs1XPBmaEcOmohWGdP59rFBocAFDxMjugoBVLB39afSHMlQiWan9/UY8grI7PD
	 0UA4FGksqu8B2m+uQrfGjtiWOI88KiwgNLikrpRd5KK73gtFcU+bGHyPzh8cuk/zg+VuI
	 1LjopaSjbjHb/SfwsmuRKOuljv8FiNb2i18BWN4l1NBJ6lxVVz8QlH8hb3xKSL8BHaVCf
	 g/QtnlB/Cnbi4t9ElW+KvvMUyDE4XEUVF3Qa1GDAhzgfEoB70hIi4aOe2LGxIG7vVr8L7
	 ++oZEgHi9LMN9hwSWzPa6+AGtwgHpknQmZenBFlpaL8hRZkRg2ORQBQYa/xHAMXhq4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w5iG2ab7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5EA606A682
	for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 21:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E5EA606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w5iG2ab7
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67990a45e02so1591220d50.3
        for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 13:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795209662; cv=none;
        d=google.com; s=arc-20260327;
        b=QRSX1mDr7ur/LajiQXLF6c3jxBh5b7jvtxZZpgFb8oo2pXFViBWqMOsJDn25pOSxf5
         Bq8ztuNNciEKTKP4oGox4eqzLArVCnE+g+H8L2oixC4VKnDNPZhLDMv6r3eg70s4Yh9U
         O4XjAIgn1M0LLihrzXUjf9YpcVsHtPi3sx8yE4FQNj2KH3M8mB7COFiSD5se4mLJAHOo
         x9Vm1swuwT0fjc0g/H0nEWL4DkV03PtDLtBjtb+OXhV8cX+QiF6nt2GijLXbQlFZFewQ
         +SdhLBGTdLCQxk5SDvt1AUkY7PyfWrK58JeN+mcZC07peb62C0IPAMTmaMwtoRf8UCHC
         Xs4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/bp17v/3ZHhsoQMU6nx2J6BcLDJx76v/oDq4/FAEwGw=;
        fh=q0kclDgMuhLMgGQH1nvieG3M2Fv5IZoB6sCp2/Ck8QI=;
        b=rT7up+ZTCfpjyNm0OTDKvgFfkoV34wXpSst41v4NyZDs/z17niTlgTb3J4tuT1S3Mz
         tI052IkiP22qmHWbZ+eac6TThtKa0WbURzWCdF+YEQj9oxeVr0BVd3Dvfw51a1Cb/E5X
         AOS5bin2sAJEwX0JiEHtgAjdVgCXEEhvCMZG7Oc2Q7KyDEhqilE/eT5KPb2fW0VLgYHN
         8hNWI6Bg33Ymjzp3ARCiAkGgW5tLkjuLZiAF6cVCOPMQNnE/BhUEg3Kv9i6fNnvDgffg
         qFIGpVe6ofWbNJdVL0oVTJptEy8cMXF8FX6KnUxf8weyODxEAXLoNuUy/npii+njyR3+
         N2nQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795209662; x=1795814462; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bp17v/3ZHhsoQMU6nx2J6BcLDJx76v/oDq4/FAEwGw=;
        b=w5iG2ab7S3F0q619dyfLQ9Mup6tlCJfCvoLnFycpyCnmnazXTV0dY22UObm9oy94k+
         ElM1mGYXzje+sD767MuyvZ8n7NQq18Xd0gCTF70Ku4NygtbYYZiEGgGMxLCZuU8ksbpg
         enpaJvpeImmuMrH7KS68PQIPNIdTnsiar86rbIP4SoZ8CSK35t6y1elmEQz2Ypv/n74G
         fB9YKHpPCseeP+V19J+92P8EoKUsPwxont42DB9Tm6BLd5aQItJPNPqISuO1FpF940WT
         qc4YYdHFXqv/NowGyHDVZQFG4FQj4MvZBhPFH4u2/F+EjDi4tFA/YycJycEdAQwi3F6X
         zT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209662; x=1795814462;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/bp17v/3ZHhsoQMU6nx2J6BcLDJx76v/oDq4/FAEwGw=;
        b=E0xm88lYEmlq10i7fZYeR88/FMI4fOjn0chVgvMwu+L4OFMzPHn4bB+0h2QP5VjVjG
         Wm9cPa5+CI1Nw7EvpB0zO9x2qgpM6u2XS5k1GPts3OZbEJnUGnjXXWGVPTjNv4oC5XQ7
         O/53VrHktCMkOz4QzpPknqpyaRFqJh+dlLEFQX1DRZTE//ocF6nemh/UkRrpB+RmSEzS
         qNvd5g3eEmmYBl2fXrg/SJ1ey3rSyDeGq0gezxeQtRBz2MCurD1LsL4grv+Ujq/ORamX
         q1z4pwi0H9PcCaDnayxmWkHQZBbOuvoxAfXPgWTG7+uvC8YfGW9LIX/hvhS1K3ztP6MR
         8niQ==
X-Forwarded-Encrypted: i=1; AL+hErEpYPD9hHSn5kmAVn/PUaEmvfPdddZW+sFIiZ/8ve0IYKTCiB3AN+WVva/uXMX2bTbNvBy2UQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+5m//5gPize8vKVa676LJrIt+GwT43uh/jfC7gB6G0aHsGbXST
	E7cFOIP35xBe9oz68MoEzqylRqFYNa4kJNQbi3A2renBA5m/QGrPsL7ebXtQsnCO9T/DQ91HF6g
	mVZMArH66A/tx1txQX+zIrduJpNX30eW40f66vX+YPA==
X-Gm-Gg: AZFdTZfx5AwIF5uQBgMEk+VT8sqkE6wlhz3HzagVVfuZTj+hHkFTKM08AU5rY3rpY89
	/WlCvxljUFNedyhaSmS9YM1vsDYEr+PIdV38+xq1zoulIUgA6C812alRrIv2BIPV7qFcOjpwV8P
	OKypnD+QbraFQErndSUxWCiKN5yeGV7DLmaskJeG9NoavkSUWZSWMnoerFNFg7I4iG3iyy9USa4
	OnR8FVOah47AKqRVdbW3f+CqvAdyHD4zGhYhQi0Lz1j5VyQkNQp6IlF4zrBQEsD7WhAYmeR62Kz
	sQLvMaNPIhwFyxYhCo9U1fRvCuOjB2oR6HqPQfsGI0dc8btYgmfHF4YwlAl1mZfU9LQdHkCiT1e
	Ag3o137Gsct+d6Rw865uV6cpG8jg9h4IuMbpV4iohYHK4DxA6gXybuoeAdjhEdS7BSlMeD2BQ0+
	kJcihRe7ERGY2QiU9BUuigQiRt9O90EiLXuPhMEvxSZiaJ3udiEQXhnFJcGEq37pRz91PqtcE9n
	f8eJue+Alfv5Ww/eTW3RQEoaVYCX18+Qqmrgi+//epF0apkB/LC6BeEocIjG76IwNVLlAYfzIZm
	GjY9IBgFaA+YfpUx//POGWX0EvWUYi19cpdTU9i3bnzf757dgVDwir2bZYr6LE8LcMn10zG5C19
	VCdUAh/QWQIaFtZD9pS5fbWk4P4CYkk/t7crTvl3v5TFZGMlmGZCGcgbL63IbQDO/i1t9HzH+Ub
	kXimQqj60szmEOEnGUcAiFhY8MCiLx062vgznLXNhDItW0c5ugy47xqUK4Dwa11mNFM5le
X-Received: by 2002:a05:690e:4085:b0:67d:ad36:d42c with SMTP id
 956f58d0204a3-67df42b39eamr2556768d50.15.1795209661976; Fri, 20 Nov 2026
 13:21:01 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-apple-t603x-support-v2-0-606b4f5fadc5@jannau.net> <20261120-apple-t603x-support-v2-1-606b4f5fadc5@jannau.net>
In-Reply-To: <20261120-apple-t603x-support-v2-1-606b4f5fadc5@jannau.net>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 20 Nov 2026 23:20:26 +0200
X-Gm-Features: AclHuK9YCo6VcZCZmjmXNJz4X_tAXUrjkN_lG45o4-XNklGa59kRk_S3c5e06Bs
Message-ID: <CAC_iWjJLyyBxiukx5VofONZ7ni4+KDMFDD6XrdEzTdtk8Vvnig@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] doc: apple: Add Apple M3 as supported SoC
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.u-boot-project.org, Mark Kettenis <kettenis@openbsd.org>, 
	Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, asahi@lists.linux.dev, 
	Anshul Dalal <anshuld@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 20:53, Janne Grunau <j@jannau.net> wrote:
>
> Adding M3 (t8122) to the documentation was missed in commit a1a47eee6763
> ("arm: apple: Add Apple M3 (t8122) support").
> Since Apple silicon SoCs have switched to upstream DTS stop listing SoCs
> with device trees. The expectation is that u-boot support is added
> together with Linux support. So the device trees might lag a little
> behind. Since u-boot's dtbs are usually not used on Apple SoCs this is
> not an issue.
>
> Fixes: a1a47eee6763 ("arm: apple: Add Apple M3 (t8122) support")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

>  doc/board/apple/m1.rst | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/doc/board/apple/m1.rst b/doc/board/apple/m1.rst
> index 900c5e6d91ea..66ed247eca26 100644
> --- a/doc/board/apple/m1.rst
> +++ b/doc/board/apple/m1.rst
> @@ -9,6 +9,7 @@ the following SoCs work:
>
>   - Apple M1 SoC (t8103)
>   - Apple M2 SoC (t8112)
> + - Apple M3 SoC (t8122)
>   - Apple M1 Pro SoC (t6000)
>   - Apple M1 Max SoC (t6001)
>   - Apple M1 Ultra SoC (t6002)
> @@ -24,8 +25,8 @@ On these SoCs the following hardware is supported:
>   - NVMe storage
>   - USB 3.1 Type-C ports
>
> -Device trees are provided in dts/upstream/src/arm64/apple/ and available
> -for all M1 and M2 (t8103, t8112, t600x and t602x) devices.
> +Device trees are provided in dts/upstream/src/arm64/apple/ and available once
> +they are merged in the Linux kernel tree.
>
>  Building U-Boot
>  ---------------
> @@ -82,5 +83,7 @@ supported SoCs.
>       - Base Address
>     * - M1 (t8103) and M2 (t8112)
>       - 0x235200000
> +   * - M3 (t8122)
> +     - 0x2a1200000
>     * - M1 Pro/Max/Ultra (t6000/t6001/t6002) and M2 Pro/Max/Ultra (t6020/t6021/t6022)
>       - 0x39b200000
>
> --
> 2.56.1
>
