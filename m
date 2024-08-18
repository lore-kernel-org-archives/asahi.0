Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A6017580
	for <asahi@lists.linux.dev>; Sun, 18 Aug 2024 07:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723967768; cv=none; b=jue+p2Acu2SmErGvm9xQquzyW+0z9XHtHCFCFv94WPENquEIzH4YPc1M5gbpsmhNPNwsYE3E81D+hR8ueiPq7JxkMK+hhrjIrgQVpHripoeQs0Dler8kJI4aQuS8Uv64mr/giw+PkFJ2TNpWcbYPOl70+MJPYbWDxkE4JwWROUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723967768; c=relaxed/simple;
	bh=t8uTSm1OjmGe81hLPjCF+uvzw8vE2zCcTHLtkDeI8gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MidPrvXFw/8JsHgLeTYYXSXrz5P1LEJ1sq2kSQ39QqHhqC0ar89LttGnsPTaHPIjYvoePaAfk3aprMr9N2L/X42TdZWudHua99jNszZg+slBhVoGhienB96d42McLmtbU4qgD6jOSaDcQwQ0oxDS3/1fkj3FHV9O7vhApYy1pVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P85/YhFW; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P85/YhFW"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-70941cb73e9so1738527a34.2
        for <asahi@lists.linux.dev>; Sun, 18 Aug 2024 00:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723967766; x=1724572566; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8uTSm1OjmGe81hLPjCF+uvzw8vE2zCcTHLtkDeI8gQ=;
        b=P85/YhFWGbZmj+7PlO3xHmmjmeN9nSaO5ClMyaQ8OzCqecyHgPEIfmmSI+BwDw2ix1
         1xfGpM00FoZHDaSoZdeiW48oZ81QO+oR3XH/JVzPkF/1ZSbE+cOBB7uCw4tPA5Ri392D
         NF3Augofff2EVVHHVAUF+iRjtEpxnnKlB4we+cUW2sBIVGCSbtdsZHaFdB4K6v0tDbtZ
         Jy1H8QXVRb9n5jRZPkXVPDki0ID13pdpjRBvWjAGqIVBXC5yE4M6eB+pILC33BwWpSbE
         gW4dnPWZqJELzJdAccYQqSt8vwquwtgqapceTxyLHDOFliRJkizw0st3Mn6A1mMT3o6z
         B/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723967766; x=1724572566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8uTSm1OjmGe81hLPjCF+uvzw8vE2zCcTHLtkDeI8gQ=;
        b=OJNTzfzPgMY9EsnYyEq45bvoW9NZl9tFyT6jmIVzVW8TEvU8Hv9xDrgDyAYlZGzcX/
         +L8TU2z0p62XC8fbON7i/8awdhM+MJr0UP9t0Sjtl+iU+X4i5bmSCSCBVZrY56scSCoF
         5c2f+Z3y5NUMT9BuOp8GEmVDc3KknkmknfGKkJfyRSFXZqoECoDSQqpjQrDy5LC9Ms0/
         qil7/mrIVrYLC95db5LSE/ZFSBaPzxOLqYVGi/lNKNQTVJ74TYZ2X+rEPuovLpm8YZEF
         3GHlqVzmW+FY9RzCg5+8zZeqEWmA6YnF58gLjQPtn+2VuMptuAnkrymFwN72VakJnyV3
         xJIw==
X-Forwarded-Encrypted: i=1; AJvYcCXimuBF+JY77cS00Gi3ihCSLUAe7QuYca5Ii+V1/S926cAm0XmOLiIHyBiSO+Kfw+LaUMpb2Li5zI+u+SoiYmCyhJ+7Fks=
X-Gm-Message-State: AOJu0YyRXjVaBEM5AIor7ZNUpitcoWFJGoQnY2d1rBegqQmFGrBpBPHE
	dunrPbaZcFabb2RlTEfE5NZeHfXgASqoAo2isMfo1qEBWce2qaCXFtcqltUWTOqG97uQbWbZaZc
	buDUh1nHsU5wDWGToLBu+dfU9vgo=
X-Google-Smtp-Source: AGHT+IE8dlSq6w4uSu8TfcVMBsnyNvLPxKquFZ2sa9LhlUsXBcdL+i+13pUBqqGyAHNhB2vDZCvcqwzH6s1kn1pAkFU=
X-Received: by 2002:a05:6830:4491:b0:709:5601:abea with SMTP id
 46e09a7af769-70cac85fd75mr9405560a34.10.1723967765943; Sun, 18 Aug 2024
 00:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240731125615.3368813-1-neal@gompa.dev> <CAEg-Je9qtud+9uJdratbLmD9EOWPrFh8xn5==-ip_AMZF82Vsw@mail.gmail.com>
In-Reply-To: <CAEg-Je9qtud+9uJdratbLmD9EOWPrFh8xn5==-ip_AMZF82Vsw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Aug 2024 09:55:53 +0200
Message-ID: <CANiq72mji_iFPx+f7pXy8b47KB9XfYrZzLcSJA2kaa4oQpgxwQ@mail.gmail.com>
Subject: Re: [PATCH v2] init/Kconfig: Only block on RANDSTRUCT for RUST
To: Neal Gompa <neal@gompa.dev>
Cc: rust-for-linux@vger.kernel.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 9:04=E2=80=AFAM Neal Gompa <neal@gompa.dev> wrote:
>
> Bump for notice... Can we get this looked at to incorporate for 6.11?

We have not picked up any patch yet. -rc4 will be out later today,
where we will start applying things on top.

Thanks!

Cheers,
Miguel
