Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177833207
	for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 06:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464243; cv=none; b=fs61oFXM2ygsXfI/9Btv1Ws8AerYQtjTamjUNgZOmWOjSh9U4yBNdgl1ITF9PlhogWCTLhSqbioSKz9Ub7HSMoZ692XwOWMK4T/w7fJuyHqdZwUIjAcFChJjzXtaIjKXZXhLKbrwllsm5YgwWSqothy43rqeoTOcAqoEc+d2YLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464243; c=relaxed/simple;
	bh=+OIw2U7cW2Aih9mzXBesBSFmW2rsvEzWJRPKAL7iUgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwBQSTd2aCrTlX52jbYKmwdadLRtafyOuqh8R1fRGie7uLxx8vfRipbY69g2fcA4mwI2lEVVdbMcYWmQZsBp2uSlyWrhv0cRFU07KpINPQEdvNDZ9Q6uXAbaluiODfTjKEtGMW2Zm+KaEIcYln4Z4+GamMJFa9JCpdu8JX2pEjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoLNyLqX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoLNyLqX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220d132f16dso80150065ad.0
        for <asahi@lists.linux.dev>; Mon, 24 Feb 2025 22:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464241; x=1741069041; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w/ATSqnAwKiVvZcf6pu7CEp14XGA+aCxxd64pSRjACU=;
        b=SoLNyLqXLwdO//c/0vQ4GFPDDczET21EVPloUl2kcj4hnF1rBMXvd6kxNCx/v7vVme
         /UD/wQa1qtNBU+x5IdW4k0Q0Yf93t3SvZGllHixjdqJe6dXI6GHwUV0f4aOesOxR6Kuv
         cRAx/ZK6W1tvqg1xDA0ynwm4R1u5LAOo/67SWUdYb8xh2N1EK9/qe9c5F2bY6n33aUg6
         uXlnnq29ZVLgao3/TvEytGXCF5aUcv7qDA12JMxJfXY+6PmDKEcDZUW8u8Ub/5KGxPFe
         qmvueSnmJq2cDjjS+YYCbs5cUME+pviNF/qvX4oAxWToRj/x1TrHDBVre/kAkTyxrIpC
         XAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464241; x=1741069041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/ATSqnAwKiVvZcf6pu7CEp14XGA+aCxxd64pSRjACU=;
        b=uyY3l/D5voN90FOwEissNwpSontr6EcPXiO7EWjqXowaHZuzRqlQERie5tTSzmI4ey
         kBapfMAoKBPZ9W8mUipz2yOT5KiTOKFFaLSAOJAa+IVhCti0CH4PlQxbaUdeeq7D3z1T
         7WI44PVQwDFzW1nIhU75kE1IHCgCjyZTofI0AP2ILxLmlUirGVmFcv1/MEyVc/9kJqgF
         H1B45+DIJ8ijHKw4TSNoSzTsehqFAzI82IiRGfERzemuVHZ7zJIVKuaP58dJreAYGKdn
         QBsS5RfgUBwdYAPOCMFqlgYuGfokKTZurwjQjrv5Jnd+TPM4pVWbq4Rhy+NpfNQvix9m
         oniQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtV+vv0Si30Whl/+kGdfiL7C2+y3sNeA67am+bQFWA2Td6HL1c+yMYLYbyIRgqrN6x7wgpmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyA3HsO42NP4KjmpJvONyplEJkMhsYRBeD+07nC4MOl2UTBQS0h
	w2yZsbM9kVXnaDhIGb0Q0ENDfKfVPLdR2wLqFgRkSakkiGoIIe12pTRR4A==
X-Gm-Gg: ASbGncvFNX0g6IkHx3Gi9yEuoa1f4qEMi2f9nyQXrrZh4bYzfdkPlpuF6UZSyTV2l4L
	PVIDZfzJxU4zzd9C2iTop85Ll+UG5O5QR86ld/afW7RJA5tOcDyLvsKuxN2Bz5ipjN8mf1eMebh
	X/WQ8y5w6444WLz0Yr1UgBcOfH+SAgMh6PjPBxZvnufdEo2KDjPRAZigob/8hxgc84u1QHKn43N
	hg5qM7ebzxZaZpcQWQY17ezKHquAROh4aMXp+7vn+jb1ntRompoYAHlqWMfa9CAzcP5mBdorD4v
	9f5dvA4vyjkwlKg8jw/WaotL08c=
X-Google-Smtp-Source: AGHT+IFdfc+NREhBU5f8tx8tcf6BbapEfu39IDYdFhX5e4nIcAOaurJrGx0qrdviMD4V0yM96cEyOQ==
X-Received: by 2002:a05:6a20:6a10:b0:1ee:73ee:bcf4 with SMTP id adf61e73a8af0-1eef3c49054mr30784128637.2.1740464241392;
        Mon, 24 Feb 2025 22:17:21 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9b5csm686996b3a.90.2025.02.24.22.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:17:21 -0800 (PST)
Date: Mon, 24 Feb 2025 22:17:18 -0800
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH RESEND v6 1/4] dt-bindings: input: touchscreen: Add Z2
 controller
Message-ID: <Z71gbmXAHjX-BTrD@google.com>
References: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
 <20250217-z2-v6-1-c2115d6e5a8f@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-z2-v6-1-c2115d6e5a8f@gmail.com>

On Mon, Feb 17, 2025 at 12:38:01PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add bindings for touchscreen controllers attached using the Z2 protocol.
> Those are present in most Apple devices.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry
