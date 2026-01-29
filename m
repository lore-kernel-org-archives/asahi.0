Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1477836A013
	for <asahi@lists.linux.dev>; Thu, 29 Jan 2026 22:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769724497; cv=pass; b=OEmI8FRrLbK/6YV+CoTd1PARiVNS3/FJ4nYKKJlRPmvFZ8c1ALDL7OEdVexh9uzzwk1dafed6Xk6xG/Zg5iRHQ8U0izDQsrJDFwfvtyMig3cWT7AJ6JBU3DZZETlQ7tz8GBn5uNrwWfM06m/bJ06Kg1yxfP2nEvj4He5wh3soZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769724497; c=relaxed/simple;
	bh=QBU9yORRz70hrvVwskbJQIqVDQjeGD47kc0NHngLRNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fakfY0PAdWy4bj9+PvW3pyLu6M4kfGL8v+7HuBaEZug0zk9gKVW5PRnBg7N4rfKv2RyQYOxqCwCwHyk+EVL62nk0FXen/Zs+vS5CjV/z/i11thyqQ6EJXS8N/PfXYZrPg2J1x2ScCTFirMHuBrrwk9bDMDLLckiEtQCWgX6U9pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d64d3dLV; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d64d3dLV"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-505aaab61d9so5111421cf.0
        for <asahi@lists.linux.dev>; Thu, 29 Jan 2026 14:08:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769724495; cv=none;
        d=google.com; s=arc-20240605;
        b=HLKmE19dv+UVCn3bHOkhZINq1mseZgXJ/fYBz581hsdwHtkzEraoSTeU84S5aEcL8W
         Ce++yqdOSxAbC8V1aL2W+Yt10tRcs5uUbxi7NraErnesVi8IzzJuCKOYjUoIk5sHWDZS
         pJsGc6zQWfbMDX3MD0NUiTbHn8MyD7Q95O5TfFSxLCuFVtsPAcm7XH4YUWw3cOHHpWPI
         ASjkl1VyGV8QzhYlbJl5EaPoEcoB4dPYf0Gyg8A/g/1i+bz3BNLrq5a2UlebzcZ7ZZfw
         P0vwpub3+bNpxndE97gyIhcoke/DtmyVNUEXguh3h0yLSTA/bku621BfrdcVLw5RBMHX
         yTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QBU9yORRz70hrvVwskbJQIqVDQjeGD47kc0NHngLRNY=;
        fh=mHkOnYPHOqzh70RAcMNBqfzI4yxf0QEKWgPUQv8py80=;
        b=VixMp6OjC32WgIy1+1HLQduUcbOK3XvNTafF0cejoxwtIB0moQ9cfFj5dEUaChkXrr
         auk86abeSrs/EjLTVHdlwLh0l/yBN/RoMsJ1luH9QUapbCrBDoWJwkYF3x3axjfjDVQd
         gl6AxTgXjw1V8js9D93S/IQ9+7O/sMLyKO7TbHyNwpOCrv0vG5veyi9ow3OsvCfrIvbk
         mBoMn9Q1HQ/2QgvHGhHkRsuV6qyUouSYB3npY8/OPW3xGPZOM3eRHP2J+xktkV02QhQd
         4WvIOMD2VwB1Sh3dM9uk5Tifcybj4PXvz7YvwRo1heFCqAX4McpRWWrIy6rSWajZtz8o
         +tIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769724495; x=1770329295; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBU9yORRz70hrvVwskbJQIqVDQjeGD47kc0NHngLRNY=;
        b=d64d3dLVZvTsDJKYifBT5SLSaHKOOtI9eu6Y+nIW3fPvXcMx/0zRUMtAJitoSxY2/t
         IViZIr1/tZNJogdxq5+WZLgu3pwLmG54hcO8xdonMIaemXVolJgOUafY9gCqxD3cGBRM
         GIJCCJ6N7PZVtaCIAecSRb3eGFkRIhAB8iltfNKI+yqQmetOFj052yEZFpZU3O4Qt/qv
         UwnJTtCitfzrL0jnnAGX7d8hXnvOK23akgqmUNDRFH8j6PJBiZnylXu8oee8wrJ8Ienp
         pdgNpJQowiEdRAgQ6cyLiAbZBhiECcqrrQ6uahOjkD4PEKAxGliltMudjHRyLyAQD43e
         1v3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769724495; x=1770329295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBU9yORRz70hrvVwskbJQIqVDQjeGD47kc0NHngLRNY=;
        b=KXs+PST3xK3WmAQVJ/JFESSpU6CGiu+cEUktzl2pdHpbI4MkzV+FQX8AHSF5hVSqhg
         ig5xqbAKChiP/sDPxswpRPn9vbZ7sdD+TFNh4soy+1TeWtkZcghpKKAICaO1qhYbzIVr
         or5KM4jz3dgx6Ghg1HNSdHVTq6mLp1Dk8ll+q/HXbUA4Fw88ch7P9oKcdAbMdRz2h+3q
         lpi/cpFelEA+DG+pBEGoQqTu4DF1v+s6d2ZkfsyuSwCVSapOucUUMFIjn4ob2eNvjZBj
         VGR7PFKfKAo9cmHi2xwaCuDlEqo0M7MleIvb1dRz1tJlfYou2BEnoACX5krNpQkLqziT
         OV/g==
X-Forwarded-Encrypted: i=1; AJvYcCXk3cawr7PZJ/JmRNlflpzzXjqgB5KnQ3GL07aYrZRaQBW/JMrDE+IU3Apmg7moD2Wt3CWjHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZDlbhuatmcJ0CcWIH6uyEioDdJQowQAdoha6o3GpDAvmlgrHv
	Ki1jY/CNciVCmiNCqfqB3OxKl/wZU7Txlp3XUwjUgPbgEmWme3E/ajjALMqQUVZ4kPKDWO/psma
	UZCoX7J+gyivLWVmIRIzYqCIiCQ/TOSA=
X-Gm-Gg: AZuq6aLlZdAQGfhoA8jRG1mzO8wDUJhEWnXfT1YRHnI/ZB00XPlxj4eIB21znK0qqXY
	GaKyPuOvQMPXjZd5CStg2RT88lmRuDyh5+fe/eV0WnfGsNN4qShdXMMOIYeqerNYyu61ZYM/42W
	waf0ovhXvqQ3HVa6alaWpTx5+KAoQn930dOiw/YRC0LcDiHf385DnbIi6kVodVYamCYcHWoX4Rh
	5tprQu/oUEq1Q5uyU16D8eiacat69PcWCESIA/wxFuUN7TMxI0C1yGPIW1mWPCbQMGq39uFlDuC
	sqIcIrJklM6kWn2o48L1XoparAYwd1xhz+2iUzaIzmJfI3Ohcqg3Sn58fqkKNW3hA5uy3fmQTUh
	t7iYyBOnHTNKgbPqI7xAl6DkMhvVJA3/fJeA=
X-Received: by 2002:ac8:5f94:0:b0:4ed:67ea:1e5d with SMTP id
 d75a77b69052e-505d2262d40mr11673491cf.53.1769724495023; Thu, 29 Jan 2026
 14:08:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119195817.GA1035354@ax162> <010a8554-6413-42ff-8d73-1811dffbb5dd@roeck-us.net>
 <56e7dcd2-2d09-439c-b8b6-82c2a1bd9c5d@roeck-us.net>
In-Reply-To: <56e7dcd2-2d09-439c-b8b6-82c2a1bd9c5d@roeck-us.net>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Fri, 30 Jan 2026 08:08:04 +1000
X-Gm-Features: AZwV_QgxO67azIshucQeQd4QcXffKxnNSCmT2SZkxvrTw3PDTtWTVIBurrRwfAE
Message-ID: <CAHgNfTynZHNt3=JY82-WPR1b_1JyoJ=hnazcPwJtSStOZsA1=g@mail.gmail.com>
Subject: Re: FIELD_PREP failure in drivers/hwmon/macsmc-hwmon.c
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, Jan 30, 2026 at 4:26=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> I didn't get any response, so I submitted two patches which should
> fix at least some of the problems with the driver.

Apologies for getting to this last week. I have been both out of town for w=
ork
and extremely unwell for most of this month. Thank you for taking a look.

> Guenter
James
