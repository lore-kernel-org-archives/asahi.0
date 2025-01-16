Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AECE1DDC3A
	for <asahi@lists.linux.dev>; Thu, 16 Jan 2025 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737051340; cv=none; b=vEomon5IrzNrhHtyVUoG9uqdLa5U3CBEEOIscDOsIVuoFnOFi6Xb+aFUDcBTR5BN8ozfvyvfg0xdU9Vk4B6jgVk/ZRbN4IX1riFE5TWTNeK3sUpCxeFy/7bDsZwV4Yqo/m0rjrAMvUlFp2OZRsT+UCENyIG08mnkp2JwRZSgT2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737051340; c=relaxed/simple;
	bh=KptHDReiAuAVut0TbIhwrjmU//EamaUBcbLJsjyU1Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvwZ6XsAKM7fxQXbWFSvikmjhvWpufjoIJTTdhctpIr578KUerK8jkfZ0WCYpzQw/HBEHbVi2rjBNHg4bQUNBAz3k5z8r2rYnBxifqvyDt8L1xER3hwjhJ9bWyDuGJ83+ub7jYc4JLRcuJcE2Ifb4L2SjtvRxEnVohdKG0xRYWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVNIEmFZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVNIEmFZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21634338cfdso31269065ad.2
        for <asahi@lists.linux.dev>; Thu, 16 Jan 2025 10:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737051338; x=1737656138; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rtOVxbgChZ7onBpUetKBIJWrka8DDr9EfUQBHMNVzrA=;
        b=iVNIEmFZ/yrYHGWiy+PUTyq+Q4xi/GqvgfuOxzdZoZgrxxQ3h2pE2nd6hV1+jBvW2Q
         gURmoUeNKRYIETn7N5S/2UfNgMBHFf/wr0/bpKCLOVMiuvRJdhmvT65VXfohA/fW6BMw
         tTRXQG5PRfxO+844v2BLVDEvdMuZV9ndpCRIbGODzU6/EYXR7WOuyHsgCSQZaK6mi3OZ
         AS6eBzkpaW6yI6bo5AjVfJlocYxGKvRwh+IzKo8rgVoIITpY4aV7ZIZZn4xrc8LOr150
         w6ic+NpMEhb/3DQEECXwI8wtftvFW3KNBlvcwu0eNQIew2DH3sG0kWvclMv2BSQA8kiO
         XQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737051338; x=1737656138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rtOVxbgChZ7onBpUetKBIJWrka8DDr9EfUQBHMNVzrA=;
        b=qUqcxlBJSljzUZQocQwjcT9xdmWPj5tdaqgbbymb9ZHLy9sxmOcpcJxa3CFZ4xAYEF
         Pw7OwDS8Y+e+U0zx1u/VhtwROJtEKbKtEIPlscvHSTaYNIETDSWF7m8TRzqlc+EXiS/z
         Faco6iil2qYCNLUeTkPPrbgNw/rQoD+6rIr90+9k3B0a9AtNkJRTCAFzGTxO4ov5x5WL
         YG0w4D3gZFXv6HhsfSANgm3oRqDk4WR/jsDwwIZlWy29ZYLQDLcUprtPHWwtNvTQ2Ghx
         y9oB/8IgXh1mEWrttyIrjtbsu4UYnvw31aiy/T8/0AJuMCKJqhORVCVWOhLJACtfBNGl
         Kn0g==
X-Forwarded-Encrypted: i=1; AJvYcCV9gbiq/1WYgKD/rsEYp+uwBemmlO3PJ7fhdlzf0jxkFKv0gL35i4cPR/yqx0BEgP0WFyhh0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcSCPXcB3ZNA/F+YVlX9Bd7WTs7p6lW4v10ou605IX6Q0TLfjd
	dPqieUCUmZcMzmbjRQcctLj7Ju3fNoEzF5pyUQKzxXEYuJMaEHjH
X-Gm-Gg: ASbGncsoqyL9MWD3pKejDSIeqEV2oZre7zE9B+VrJJ72MtwRdUHa8mMJA9lWnTkEbZ0
	QCz2qdVifzt2yoOXoBhfQGv1yJkvYJdKauthtaJAcUnAKyOHxwihb5VLBx5dBWMSY+xKCU4U0qO
	NToKqyM7ygwnZzzrJOM/6toR6vxaqBBcnbg4R1ha6DTQSb8P7wjA1JwtxBJCQPtfLEuNnLlKAGQ
	y+DEm4hIP3chGuVyZAYPddSi3aYH7O5UMDOYm+IIXu1ZwOio1CEwljZ5g==
X-Google-Smtp-Source: AGHT+IGdo5ig12ulCIg57VUHccD9Uy0qJdr/79Z8+d6H17KB/rpCQR7jmI4tw4oL7Fnmr9aw5T6/Xg==
X-Received: by 2002:a17:902:da82:b0:217:803a:e47a with SMTP id d9443c01a7336-21a83f3eff2mr499223585ad.4.1737051336701;
        Thu, 16 Jan 2025 10:15:36 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:a7ea:d193:fb69:2f82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611f0a0sm438250a91.6.2025.01.16.10.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 10:15:36 -0800 (PST)
Date: Thu, 16 Jan 2025 10:15:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: devnull+fnkl.kernel.gmail.com@kernel.org, alyssa@rosenzweig.io,
	asahi@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, fnkl.kernel@gmail.com, j@jannau.net,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	marcan@marcan.st, neal@gompa.dev, robh@kernel.org,
	rydberg@bitmath.org, sven@svenpeter.dev
Subject: Re: [PATCH v4 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z4lMxdFWrZorX0h2@google.com>
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
 <20250115-z2-v4-2-d7361ab16ba0@gmail.com>
 <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr>

On Thu, Jan 16, 2025 at 07:03:13PM +0100, Christophe JAILLET wrote:
> Le 15/01/2025 à 23:46, Sasha Finkelstein via B4 Relay a écrit :
> 
> > +
> > +	/* Wait for device reset to finish */
> > +	usleep_range(5000, 10000);
> > +	error = apple_z2_boot(z2);
> > +	if (error)
> > +		return error;
> > +	return 0;
> 
> Nitpick: These 4 lines could be just:
> 	return apple_z2_boot(z2);

The current form is actually my preference - if a function has multiple
points of failure then do

	error = action(...);
	if (error)
		return error;

everywhere with final "return 0;" at the end. This way it is easier to
rearrange code if needed.

Thanks.

-- 
Dmitry
