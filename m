Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3F833FD
	for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 01:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732672308; cv=none; b=I4pgkeJfS2y7rcCp/ZFgPHm/0Txun8VI53tSHaUWqPXrMvYMQLFbZnC3Tj7j85tdmePB1yYSGUUxo5T/PLpgJCTiuuNZis63V8Rh0+6CMPm80Xuh6ZJnh48KUVogZIXvaEvuRVDOxIT5TijZwgezopq/hlbDAqq33DmMNWteg44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732672308; c=relaxed/simple;
	bh=NidMgqMWIjDze9tE3gkGIg9VormyUGi9/RD3MgaGCmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akp4k1pp7CZBD85GRlQ0NB6l+5aBtw2G/j2skyjuGW+oknUN63Lqw6PjO5J/e66ELX9/mY/MzTeE6jztCUah64A2gxMhlkbcLHIrC5iZRpkK2Ctx/b0QUa8o/Yu3GNqaPMlaeRnXHg9D0XzBgJeE7ChfO63L1QlNKoq1DId2BXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blFDhzze; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blFDhzze"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fbd76941ccso3013283a12.2
        for <asahi@lists.linux.dev>; Tue, 26 Nov 2024 17:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732672306; x=1733277106; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6yJthSITZz0JgeCwZB+IqdVfVUyc0ONXrqOpbvTgLw=;
        b=blFDhzzeqwgvu9gCGykCMLm7zuLwQHUvJosdGMBzcwpheGXTPBNQ6qT2G0ytLGIqmW
         Yc8cXaDZoYOcVMNdyminiJFawGjPjDSVf/jgmNZWSNQlfdfYoG2bSglCvjdf2oZfA/cB
         9AlEbFDYj7fDTO+jSv2lWyIbW2M9oEXdOUZ/P9jLlQOyHGE8Bu0lVjAyHOVWdVL7rcXM
         wiXtQJoiGKX93KxgPR4bniYkF8G5RiS0/huBo9/jL2NEvVMXm0R9+H3E/JYKYem+rOT/
         /0zB185FQccPW8HZZ9uPlyqkJk30wKof1NJb3u3AJPSI0j6fQ/LkmBBHPqE9lQmW4np/
         dSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732672306; x=1733277106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6yJthSITZz0JgeCwZB+IqdVfVUyc0ONXrqOpbvTgLw=;
        b=w8HpLcLWvR0A7f4JszBHxJRLK8lXIH8FESAw6+HzV0c3cvd3HAGM7w2c8mNhwCP9u2
         ow8aYlwVEdA3h25oE57WEB0MmT8xiL7Zll8P4p9UeYl9RwlCyrhAihZ6w3s1JbsPj9QA
         Y5WpJllb3Yz7vQKVbo4Hcy+0Youi4Yxug8Jgj4B/7AbUgs75QOUk38rfjdSgvNHLqnj+
         p9VJpbJsh0U/NCujro6O5VEO7enjFbbRW2Nd5Cq6UANhxC5nP7+9DfQb6gm2l2bwcnUN
         JtjGC4NRdRWgmkMP96yeI0HEgtNpFzI6l/Rx88xIi4l2nk8ZsDuMHZc3XEWrQx/6gbcL
         jE8A==
X-Forwarded-Encrypted: i=1; AJvYcCVe3KaNA5Mq5ikvCxaQkUi8Saiir/qiqk2gO9XD1YxOzExzp63kiB+TDHtFk6gcDubENgAUTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxV8z1DpLAt/RrYugodVo0JSsJbWmsy1Kz4zwk4xt0L8VIsQC+J
	rw0aQfs9ebafYGaFyZ8Oj+jJghenr1gm703fy0A832AK5nbVkTn9
X-Gm-Gg: ASbGnctwAaA5AHPebc/+p+zJDL58SIjAEAN6LjVHpyny4+JZuRnhaPUEcuXygeH3FhM
	C1reqTtvxSPAvSXRFbjc6EV3HOtHISC1IO7HmJ6k/vr6vN4DkL94cSSp44rfPFSC5QmVOd5zzfA
	9yALW98x8H5WmC7pt+6dHpRcPywu4X3zwW/PoPO+qow3sre/e+MOOUAMvIOM17VWiDfhqQdDZns
	q3hJNUii/a+WXVM5CQh39ugN9H1XQfKixRQCgHD8fTIsUqlazU=
X-Google-Smtp-Source: AGHT+IGWUC26ECFB/XST5h32zsfNM+cTFebDB426koYcgqVJ4sR4f37BBk7oSc1604wiVBTnh/A1ng==
X-Received: by 2002:a17:90b:1d81:b0:2ea:7d8f:6f17 with SMTP id 98e67ed59e1d1-2ee08eb5cecmr2142866a91.10.1732672306240;
        Tue, 26 Nov 2024 17:51:46 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee0fa6134fsm248728a91.18.2024.11.26.17.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 17:51:45 -0800 (PST)
Date: Tue, 26 Nov 2024 17:51:42 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] Driver for Apple Z2 touchscreens.
Message-ID: <Z0Z7Lrv3rBfzac_e@google.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>

Hi Sasha,

On Tue, Nov 26, 2024 at 09:47:58PM +0100, Sasha Finkelstein via B4 Relay wrote:
> Hi.
> 
> This series adds support for Apple touchscreens using the Z2 protocol.
> Those are used as the primary touchscreen on mobile Apple devices, and for the
> touchbar on laptops using the M-series chips. (T1/T2 laptops have a coprocessor
> in charge of speaking Z2 to the touchbar).
> 
> Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com/
> The changes since then mostly address the review feedback, but also
> add another machine that has this specific controller.
> 
> The extra gpio needed to be toggled turned out to be a quirk of the
> j293, normal CS is unusable on it, and a gpio has to be used instead.
> (j493 does not have this quirk)

I believe this needs to be done at the SPI controller level. See
"cs-gpiods" property in
Documentation/devicetree/bindings/spi/spi-controller.yaml that, as far
as I understand, allows overriding controller's native CS handling with
a GPIO when needed.

Cc-ing Mark Brown.

Thanks.

-- 
Dmitry
