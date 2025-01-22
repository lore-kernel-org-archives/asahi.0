Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C696213255
	for <asahi@lists.linux.dev>; Wed, 22 Jan 2025 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737570791; cv=none; b=XfFKoS8GzuFcOwOE3aemc05gOlvfN8HC5PazaQPUbbIaJGpwVni25B5ekkjTDu2JYn/1LwVtqxAwOuGIpp++dycCKTdL/T6oNjQRyf9uB5m3NDBCNwhpGELj1GwcHdfF2zWEsgpfIE8L21nefDGgxMbQONAjbyoq+74KMWmPOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737570791; c=relaxed/simple;
	bh=JGbcoN7cGb3jh+qZ8vvEgIReoX/pFz2JclEC553QMIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BS8SZoV1j7UuhjcUUcCtJWVNdwFvdMefaA8sJbdK+tzJIpfG8QgzmeBS0p1zYvkroAwPAUr6PMkjQo1aAITLbpb3qHgVwM3U+iln2b7OpWPOE+VOChNhzu6S/1wXXWMfctg1XJpOTvXl0+e7QMTrx3YZEo8huxVVIu5XpSBe7k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/rlR/7j; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/rlR/7j"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so182192a91.2
        for <asahi@lists.linux.dev>; Wed, 22 Jan 2025 10:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737570789; x=1738175589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGxAfr1RErIaTjlH3ywSl69/Jh18iaYDydnvNAEir6k=;
        b=Z/rlR/7jxOYr5PR5SJorwWv8eS/oq4Sx9tQU1xoAGbZ3ioiZTHoJ5MotrSYRaftOEg
         A4Caw29kvx6BrsfnmbGj70DPvBuNwXY1ITosrv/VuEPQVk0+2noyx5PWwJgcCnE8LNoO
         B3a+YARkwoicjLNYuAMZUjhsAJuOYp5vr+OV7ixlpGWcFoZ+uBF6SwvY6A1YAMZtvYvp
         abEjyw1M/zLofi2yHH5purmE2g06xcF5xeMdYRI/1oPQNEXoFCQZwo+YMiejxN7nExCc
         iSYqEO/4LKOOGcCLypXQJyF1uuIJ68Y62SF99HjDeC7WGM5MzJI4+TmS3se3M3VG/CnW
         Uk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737570789; x=1738175589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGxAfr1RErIaTjlH3ywSl69/Jh18iaYDydnvNAEir6k=;
        b=caTdHiQfOIdBjKNjzguun34mAheDaRuYllLhQ57aayNM0LHxkOw7J2B/h/iWhFghZL
         fM4C1igBpkssrlk56N+dNDORbuxCsYR925TqeVG7YdwPnPYWOcJq8+in6vuOHnHhyl2Z
         Wjei2ldOxvdAilM5kkkAFo/k7RMerpmjjti9WXZTAUyWKLoQV/NqAStlak5D5KhorLZO
         KMolkw/p80+HLiq3AFJ80ZO5HfdE7POuHVGRNYcGj5jwaigOslRU9x+lyOmQ8EVpM8un
         lV4lMZY0ypiSvWSY0UXufKIeuKEM3mV+Wo3cxgeQDEwS2Oulo9F6v7nvt4tjZfO6G9px
         vFfg==
X-Forwarded-Encrypted: i=1; AJvYcCX5FJT4OgQXI83IrGYOqSISvOS9+tVzrEXCzzVyffsQoJdJ/0ZD+eRNctK1yvR4YvCjKx3lFg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw17HVFsbXYx0I2gZXhP71oT9jquVkDdE8LPKMMY72w2cXJLhgB
	OP4KcJOrJKXWA5kbkwjarWZNmVSaBjb+IaQeTGGVBFCUyOZsV6mQ
X-Gm-Gg: ASbGncuYTQmJiuY04SPm7MedObba3P6fgGvnOV9Lans4KOzyMRqrTd035SWXUXyuZTZ
	RS2Jel6CQMltn0xaZ9hDFl2hOcOOznZY7gpWZuISZUcQRS8JRSQB3XgIQe60PmNZRhOjDbJ8G/y
	kEjEJR6DZVEbmFwGlS8fxb0yz+qRVp6VKaA5BlM5/kfZkELu9QS5osnJPXkPK1pdqPh9eViIsm9
	AZDq+g+qSiSDm6DPhVth4h+KMLeKWCB5nPdGmHOttcG8BIiEkEbIU9O/vjEeSq+kDEvTg==
X-Google-Smtp-Source: AGHT+IH7KCx6ZerR7Y/ysqk3oOOXRwJAIgtVJJs/HwWggKSL+QPKg6M5ZcOSafU6EcNPqL9uv2Ogdg==
X-Received: by 2002:a17:90b:51ca:b0:2ee:5bc9:75c7 with SMTP id 98e67ed59e1d1-2f782c4bdc3mr28221471a91.5.1737570789085;
        Wed, 22 Jan 2025 10:33:09 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:824e:c27f:8742:e4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaca04sm2015449a91.27.2025.01.22.10.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 10:33:08 -0800 (PST)
Date: Wed, 22 Jan 2025 10:33:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v5 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z5E54dQQl9LE2znf@google.com>
References: <20250118-z2-v5-0-6d38b2582169@gmail.com>
 <20250118-z2-v5-2-6d38b2582169@gmail.com>
 <Z5CNx9natNYmJ5il@google.com>
 <CAMT+MTRKpgHBVVHoeWGmOqpF9vzZV3CTUdg4d0oOnutubeTFaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTRKpgHBVVHoeWGmOqpF9vzZV3CTUdg4d0oOnutubeTFaQ@mail.gmail.com>

On Wed, Jan 22, 2025 at 06:40:50PM +0100, Sasha Finkelstein wrote:
> On Wed, 22 Jan 2025 at 07:18, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > > +     z2->input_dev->phys = "apple_z2";
> >
> > Phys is supposed to be unique, however my understanding there could be 2
> > devices in the system?
> 
> All existing devices have at most one z2 device, and while i do not
> have visibility
> into future apple product decisions, judging by the current stack, it seems
> unlikely for them to make one that needs two of them.
> 
> > -static int apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, size_t cal_size, char *data)
> > +/* Build calibration blob, caller is responsible for freeing the blob data. */
> 
> A comment on a previous version of this patch requested to not have functions
> that require the caller to free the return value
> https://lore.kernel.org/all/ZAlM2DzMmwzWIZEF@nixie71/

You have to pick your poison. Either the caller has to inspect the
property to figure out the size of the allocation, handle errors, and
provide diagnostic, and then have apple_z2_build_cal_blob() re-parse the
property and fill the provided buffer, or you can hide it all in
apple_z2_build_cal_blob() and task the caller with freeing the blob when
they're done with it. Similar to request_firmware() and put_firmware().

I think the latter works better in this particular case.

Thanks.

-- 
Dmitry
