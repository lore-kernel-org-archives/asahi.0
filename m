Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ACE19922F
	for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732703476; cv=none; b=OX905bvFd1HANSOr08SFeRMTWF4N7FTwnEe2/exTgII6MKBbC0Lc+5hc2/OED3FfSYPl+mQ0xY9PpJ2Frny5P7C413eSW2vtGSVUMz2rTlzWCg6Kb5stkTWWFhmz5nTmBGZEWakhBaUTOe1lkp9oUgJaR6hKg1I72RJPJGVrSvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732703476; c=relaxed/simple;
	bh=6Zr5foNoeYHy00EYMyERNSF8LJh3JyyQLGIUZ+TN3qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3AC5zz8e+X5bFlecpzSr11xvlZ8IPjgRbe5g9CSNKxgiflxaHpOg+er4WhdTRK9nwODikUgx+8O7/BAsWn/wliILdzWSaOetRdZOAXdjBwhOlqD2A1rJ4ZVA6BILAi1WzNk2PwTAfAHu3U37IhEdSlXoWdLPE7wCcFKdoZhbFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lU3S2FmV; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lU3S2FmV"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6eeb31b10ceso65713707b3.1
        for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 02:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732703474; x=1733308274; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6+tMGsu8kyM/fcIHQ4a5jlISh9lUT5BBdpOf/BUGU00=;
        b=lU3S2FmVYoiBkFCWtTJs3wjhHfWCmJbM1OudQVAeDdIvGhAE4JwUDY6VhDRzcXPzKS
         bN6tx/RQNKnQPunp14zx2pJOGLyyNx8bIW8xmrZaAV6yOGZvU+iMjpS6vMLXfzfHyCB9
         gzi7HLEF/MdFHCoKOS4FtDCuoOA2R4eYm8LSHICmCebPkJ3rsNtFMZZQX8FVUq9thlCZ
         lrW2ksTU7ptXK1o96w98Lv8u/UlY2LebXbgDVooAo+nkwEJuzunEtDRtPzayPNnFzV1z
         UTFAZJtkEY/e8GVVcLptFIxoyK3DcpMEHXNxR2rxknFg/vyZfVXIyNYuVxZgwxW9FE8O
         DUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732703474; x=1733308274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+tMGsu8kyM/fcIHQ4a5jlISh9lUT5BBdpOf/BUGU00=;
        b=wEsYf3IQLNGn7k9zwyNMOqMu+0FgGUbGho9L2u3K9Vl4+DGKKShm74E+if33MbOGRl
         KmJIVHM00PU7b3INL/hFZlv7pk9HeaRzlIHqBQqTtdNaQ8qUHO3UMkSHTzYavuRHhR7L
         utQ8lBZThCCGPT7art2EtuL8zSrN4SwvPg2NxEit5QjFiTFeTlf1cSy4jqNO1UsdLZXS
         vNaJy5cgWr/iGGylMl1dNtv8OG77CEkjMYCljFvmYgQbWsbcCgfpWdjBgWllKbiyIzaG
         Ciy+f6NnifUepKF2v7aLl03zxVJKKWmKTvWS/uiWPzu9TCSmyPQPkBeCCcBpv9zD8m4b
         jE6g==
X-Forwarded-Encrypted: i=1; AJvYcCXK2EVzGP9+plZ+50RnHRTF5USyZqhAB8U+xs5Mh3r/MYryqffR4ndZjaXodm/+RoFB4l/nAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1ql1KhC2aG2JCKzz3NH7pOr4bMbyktlF7Rqh64o27Bpogdk/X
	QNftrgXgBuKjpDB9QNGO5C56u5PAUPRZr1p1VvnQVr0cVf89DDZQ2IF0Qy3eO43jG9EFMeN3xA1
	Fs7+9vgngFEb2+jDl4uKSm4g7yHo=
X-Gm-Gg: ASbGncuVvlmybrIxQy98nSXSGecI6+Vvy/cL4+lHhFxpxXoyXBazElPOzYvB3Vub/Sn
	W3TMxpPx5KgRPL5JxBwD9HDkU3uK6Y2X9
X-Google-Smtp-Source: AGHT+IE4Rwjoqcf6g4WNVWN6SK2tYJNiVr4zxnFoZgSAN5swW6pmwHPwkZxnwv7KUL2OiNM5h7LYDp0/itheP1WTPd4=
X-Received: by 2002:a05:6902:dc9:b0:e30:7c38:668b with SMTP id
 3f1490d57ef6-e395b94b0b1mr1678379276.37.1732703473698; Wed, 27 Nov 2024
 02:31:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-3-c43c4cc6200d@gmail.com>
 <y5xdrrb6ome4vggfadmnbtegigxlvwrxpqmwh7qhl2c7faesti@57odqxajdiwv>
In-Reply-To: <y5xdrrb6ome4vggfadmnbtegigxlvwrxpqmwh7qhl2c7faesti@57odqxajdiwv>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 11:31:02 +0100
Message-ID: <CAMT+MTQ40y0GoOHXp=UUR=79JBPUCt9DSihojZyBwcwgR5_O1Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: apple: Add touchbar digitizer nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 09:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +             touchbar0 = &touchbar0;
>
> Not used, drop.

Used by the bootloader to forward calibration data to the correct node.
