Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7F5183CA6
	for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732696173; cv=none; b=dO9HDNzdnQTB6isGQmDHJAOPrpXN5/ty6HlowP7D7djdUnSCn6dack17q6qHaxcCp8Z1RPf/U0dUltQmfX/rkqylTIcFgeGVwH799VCnxyzlkyw8dKxgsy9qorYriHy1MA2/OHjk3kM/MpN0k754LkVVrTrBWZ7KcgMFnspPJXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732696173; c=relaxed/simple;
	bh=njd05bArOgKjbgLgjHcusDaTScXAtClI9n8o3C7sop4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmBhRFX9Y/juQWwxY+0qXpTAygBxbZ/+UdLagxexfjyqRlyW21RZycri5xx5pI3fwL00anr5A0rJyn2/13SRphDwhS252a4PG2OZgFLDaLnXFumGDtdgHYkh0oWRU8dUGlZPbG+X59t9SmN8LeSi7c5ax+pwSML3+b6XAi+YM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5hfd3hJ; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5hfd3hJ"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e38df4166c7so6006115276.0
        for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 00:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732696171; x=1733300971; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=njd05bArOgKjbgLgjHcusDaTScXAtClI9n8o3C7sop4=;
        b=X5hfd3hJSDpy7wNh8gmwI8ez5dHGAd0F1h7+K38igrkBqgVp+le44lidV45fPiu/6k
         /vBry6wApIalt2kIy+C4D+z/cghJw9IfcfPFJc/Ylnj7m6zmjrWhYE3eE6TEldrdHnn9
         +QkHlQmjvSxK02FJxiBxewiouxL1JKIH2TszK5PP1/LFKAJbAI+7mLYmhWXyheXAY+WH
         z9hKmGEjUgb45BFFC45K1+jHZyg+E41ZCp654Q32nI+437/C8MlBMUgxH4bxqngqi4Sp
         cuZoyBXIyt3e/oqj5Ef+9QO2IUrDJsyNWrt7QBpbg910Jk2pIdck2wRGgoIKAwF/3WiM
         Emcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732696171; x=1733300971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njd05bArOgKjbgLgjHcusDaTScXAtClI9n8o3C7sop4=;
        b=WbOPmyScs5cA4Drywrbelh5OuCFoiAFCFaS4oy8VSMklvmJ42mDNOQeDzBUVDM6rJa
         +IbH2hCe8vm+t2yTjxnAVWNCEu17NtEWnOoaYsVzR9SE5UUsnnJ58WMAO58thRSyx1r+
         In6pBPBATsxEMEKmgvZLrNFhJvtT76b3QU9x3xqzhM4YLm2g9B+5J9Pmkqhl537dZ38r
         SEux1BFuwwOPdhl9MAQL7QdTjsxDYi/gTD495KpzRAsvBl7GUrS/YSTI3zlk83OLgiXE
         iTVNQfQ8EotdePNuGolx2G6GFduesZVKWcW9Mh+Yn+7EZJgO1aBF9yc62hZ+P/311LE3
         QibQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlNnrSvswaqIcRi9dTjBsFPRBWWu46jA6QI6Er+MoUTX1z+ANH484WssK/vvjZwzxexQVtsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAFpLKHW050TtQLtx8Kdikq+k9qp0ILEK41SCYifpD8DJe6k7b
	D0jYm+rPn8LLtXHEZNcLUvMdvKM56KoVS8G4h0wBooaSyBh8spRYEbZaBcZnbyUqQye+jLY2uF/
	gYyuyqcJKc7nF6ZmlQhARYdbkZXc=
X-Gm-Gg: ASbGncvzq9WzDy5cKBw6sG03hCWE4qVMxc2mk9TlCPVesIdt6/2jHZe4MbAANWPiZ33
	eQnt9AlgCGPrbh0j/06dmh7uFoqNb5dUB
X-Google-Smtp-Source: AGHT+IG4T6iCfTuQRbFcDR8g+9gj9vnb1SF11d4ey59iqSnin7GgRZc6RSmnNx6SkL9tm182e4/IfH05c5ENgkbSLA0=
X-Received: by 2002:a05:6902:a07:b0:e2b:df40:2588 with SMTP id
 3f1490d57ef6-e395b8a1b09mr2315229276.21.1732696170745; Wed, 27 Nov 2024
 00:29:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <Z0Z7Lrv3rBfzac_e@google.com>
In-Reply-To: <Z0Z7Lrv3rBfzac_e@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 09:29:19 +0100
Message-ID: <CAMT+MTThJoYLYhtYAHwh6F3LTApid9Em+eP2AZYc3JChC2b9ig@mail.gmail.com>
Subject: Re: [PATCH 0/4] Driver for Apple Z2 touchscreens.
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 02:51, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> I believe this needs to be done at the SPI controller level. See
> "cs-gpiods" property in
> Documentation/devicetree/bindings/spi/spi-controller.yaml that, as far
> as I understand, allows overriding controller's native CS handling with
> a GPIO when needed.

I have already tried doing that (adding the relevant gpio as cs-gpios
on the controller)
and for some reason none of my attempts worked. Since there is no hardware
documentation, I can't really tell why, could be possible that we need both
native CS and that gpio, could be memory barrier issues somewhere in
the driver core,
but the method above is the only one i could get to work.
