Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A72A2C0F9A
	for <asahi@lists.linux.dev>; Thu, 18 Dec 2025 22:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766096401; cv=none; b=rWY3Op+w03lz0czy/lAVTcIwr2YH/29lYjlw1twLM911I/MoSlyBraLF4kQIVq4PEVEHxeEZiHEQ0OeExzfqdSy2Sjiz1Qb6LWygTkZ71fqEB3xALbVC3utBiXPfTQXpxPDFgMOGl20IqXGbq4MAgBNui9NEhg5Tnd5PN16m+X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766096401; c=relaxed/simple;
	bh=9i7cze2zXw3sphfypXDmh432a+tbDocZK89YgxAxEHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnPNWOdCPns3SIkMQxLo8rQ73CnfK2Sz936ygO9nYT6cHIsscvj2ZJ3kPwpBy5LQ6S+7/8yLZp0GPW64+GYHUUFhe/JUsd9nRG1sFkzjj894VxowZuwQQxT5zxHjTtjWc29MFvumMX788xYxysqbqYvjJliVpC/Sz8xKqC530MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmFX4UOe; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmFX4UOe"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso1008021b3a.0
        for <asahi@lists.linux.dev>; Thu, 18 Dec 2025 14:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766096399; x=1766701199; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DHi2VHdVHFCMJr3d7N3lZkt4cAkpVU0QksLG1hGqfO8=;
        b=WmFX4UOe0n1I4R5nmmhwpEHtVePEMnLleg5kvxAy62SAP5iE9lezegDjwNTvN4Bi/l
         yKj3ZFuYnJhEZ2E7ALUxosnf+3CQeXRjsFEUCBkvxrv0doMLT28PDS10M7LZIYY/LOwT
         CRS27L0GC5i5dPbD9uqtWtDITxbKQ3/ma1Eiyl7Zb9ba4X+8+yin4WD2WdsJU32Acj1A
         v4twc/GF9ny5ysrNIy1KLOBQU035BJZbAKoIu1syzLKHK/+rPb0zfwXg3QPbdIY0bGl5
         D1vfxOh3cVeI+lJdJrGPS4U1PsPS9d+3f/yelPtT8ASDxdBTfONFSw0WU9ftQfjee66+
         YqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766096399; x=1766701199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHi2VHdVHFCMJr3d7N3lZkt4cAkpVU0QksLG1hGqfO8=;
        b=r8K8FnnwVnI3bW/1aCqJ85Naebn6dZOF12WIjK8nG8WUq4gcNr1Q5CXRLZkF7DaBgF
         To5qCzwfzsWEzAw6IEPOJ/NLm01iOqYwKyOjXosOeQeJaqC+rBbjAKzERMl6Z9UgGTJn
         VJa93pEyz/qr7hCZwqV/qkD2aV6QkRj7no1t9rHSW+ZHBOpR6vJ9tpXJg+vTemcRp2N4
         OMxD7iO1jVwON2HHYVfv37GrCeqYctSYdhxgyeWXl/TVD/1qNQGlQTAqlVumGfx2Gnyv
         904bD8RMY3+yJyIowosST5vq7jCnqa32TXWcJvZN1uYS87cAjXZPNsL+PFiDSgL5ycBG
         ofVw==
X-Forwarded-Encrypted: i=1; AJvYcCWznsykHu7ro4SKegjIdh/Au05TPfX1YdW9/+R+qTqBGhUpH2fN0VhvqRoTnLbGqL0xH6q+Og==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYc8CNoh4uW1CuBmdfJJzmxJqt2F/mcYPK1H9ti0NleCLogh9T
	M9ew6V5O2X/wyrGTCtoO2ba38IyAIRNwZe/CfctHJxVLM0jrVO1Iuf43
X-Gm-Gg: AY/fxX5i/dfIdANp67L/XwXWrARFTvZh+KG6Fujog5S1/G1m6o0F4GizVeLP7UDbGoq
	rG/eBmpmoeK88s2zPduDUkpHJEAcelFQeUfM7QqL4aG3deDqPYDSWqwMN41dweV/CRuuLdpZUIp
	X1u0yqpPOql1w9KaNsfCwXLrzvwXVivJNAdok4FT1se9JarNHTvkRpDEZF+IQDr2n5WdrNulKM4
	lyfnYz1qARbBvXvE4reyzJBdF+agXVjNy78IuBOnsn4ojSF4S6xRfcADvjcPQ2pZHXrpOkANJCW
	5nY8bSNNcMARhNcwwvXjyc9q+Etzzbx6CtbfkpPv+WYkQ1I1+3FdSP4hV4cQrgpKSr8DXXmFtxN
	uu2pEM++nfDWPZmirezBpzdbfN2mh0Jtb3sqEANpddp9dGl4Z/+v4er1Hf+NP9RljHWdcQHp3Vw
	KGsMPXiNplXV+QiAhryH8QuFjIWnKKN6sPuSkmPby2vU33XoFC4wQ=
X-Google-Smtp-Source: AGHT+IEJ6Dza5e+TAlnoSNxkhL516y4Cp3K+eoLm8K4vH3URG1EJpjMsZlCqp1ChQbxfdNHgZFOu0g==
X-Received: by 2002:a05:7022:4190:b0:119:e56b:98b8 with SMTP id a92af1059eb24-121722ebb6cmr841995c88.31.1766096399117;
        Thu, 18 Dec 2025 14:19:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c00:cda0:e722:e1ee])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254c734sm1678256c88.13.2025.12.18.14.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 14:19:58 -0800 (PST)
Date: Thu, 18 Dec 2025 14:19:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, pitust <piotr@stelmaszek.com>
Subject: Re: [PATCH] Input: apple_z2: Fix reading incorrect reports after
 exiting sleep
Message-ID: <snwkpf4esyxxhyo2yzq5xepgoh6nkvvqldbiqpj6zm3bbc43zn@gdsxdsza564a>
References: <20251218-z2-init-fix-v1-1-48e3aa239caf@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-z2-init-fix-v1-1-48e3aa239caf@gmail.com>

On Thu, Dec 18, 2025 at 09:11:26AM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Under certain conditions (more prevalent after a suspend/resume cycle),
> the touchscreen controller can send the "boot complete" interrupt before
> it actually finished booting. In those cases, attempting to read touch
> data resuls in a stream of "not ready" messages being read and
> interpreted as a touch report. Check that the response is in fact a
> touch report and discard it otherwise.
> 
> Reported-by: pitust <piotr@stelmaszek.com>
> Closes: https://oftc.catirclogs.org/asahi/2025-12-17#34878715;
> Fixes: 471a92f8a21a ("Input: apple_z2 - add a driver for Apple Z2 touchscreens")
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry
