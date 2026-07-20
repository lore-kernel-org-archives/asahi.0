Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266203B2FDB
	for <asahi@lists.linux.dev>; Mon, 20 Jul 2026 16:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784564250; cv=none; b=njPBpKHM598IXNdicT5+kpOQMnqmUPCko6zK80j8YYdZIjDfiPxlzeawSuVtpqw5AGWSgZqUc+0fQIQdbU7MJOUlkKJdt7A4FxMT8kSF20QAED+e7jGThEMOTIWjxLeqg3uaIIVLdzRkS397tVqHkE5k0trFrXGFnRNwBjOtTUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784564250; c=relaxed/simple;
	bh=pwEE6fibC3x6lQyfDb+v+RGRyll+J5mMBnA1XQCUdSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6oF+F0O9fpeGOiqgb146t4F6WiArEZWroxfS0zEPWj2dvLNYRrw3asAAE4wLyBPyD7rU3yIEnIEt+LSdwpQjGeXlZRmL9dI3APvKRG5GpiXouO6ITEoZyjWudcphNqfEwBog/MjVayHxZF64AcJTFWRzgRfqHrWdrHrlirBMas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1sH2EB9; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1sH2EB9"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso2536822a12.0
        for <asahi@lists.linux.dev>; Mon, 20 Jul 2026 09:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784564247; x=1785169047; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bgWQqTl41PqRe7SjquS4u/1d/gci4UsHSjvtso+pedQ=;
        b=U1sH2EB9VKNw3lYDj4O1esydkHhIOHCOjnNfQqwknaE+JolD9Tw8m7pKzoaARt/F9e
         0gfdqkdOnXdTAE8y14RiMwKFFUdMCE45ZyTvd+o544/JntBTr8J7B8m5x4mKeS6v7gB7
         /LeaoTLnxZx3uGb5WfteBU9sBmFcp5oMn1wMBB1wUECB9pOioIHz7blGpyz+YfXcgynm
         QdrNLdhJdOeQIK02EEE3jvTP1Du6Fot/HAyyywRRfk+K7XfT6f86ZV4snwSpLijUm/sR
         Mts59NJs70kyU65EEKSXGCihH/znPjuxR4Oa8Sh1dXu01Qp+rWPKerXrVB0Ai9UPDXyD
         rA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564247; x=1785169047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bgWQqTl41PqRe7SjquS4u/1d/gci4UsHSjvtso+pedQ=;
        b=aUotvOo+Ce519IHgU5JSEiy6xpXTKJ1xDzsx0gwVSy13u3TAjI6yPih/83GxQ2+ReE
         vEeHfPZ6OWaC0TKXLgc3W6cA5gtT46eIuSh3jFHflI+QbPcxR+/zJJqYaoBmujcMph1i
         CUZgRr+YEnhw7zNY82G/5XUrILWZocHyhPJ17ekF3BrxeD4tiWPKObiWosSFlJTxW8k7
         QgVi8lkNuDJf3SyQfsp0oGqqfccxTRavgGx5xrk+Kdx1MqT8gIamo0zRaR04HBl4Z71q
         xqRlgLQcHvCAufrnOGUDjVtE3c53Uh0AEj7d4Y7PQCmzz9Z7B8lSrF0H6k5uaFQ4fxXL
         1IRA==
X-Forwarded-Encrypted: i=1; AHgh+RrfMdyignnav00i+QNc7ZbM+DTZauJdnTTT/zx5jj0XsnHgzo/1crbEwU0OPutEXy6k9J/jcA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz80eIWpSVIlua1L7RmFLjvSxCYsZD2doPXyMzu2KZZ7Wz/toec
	LIxDoCiTk4Ms559TuUrSv0QgLEgRPQecW4cABFlcrlgN0u96eWLlKz7j
X-Gm-Gg: AfdE7cmp8fJDwGoxU+wFzUulMhPFLH8WtSJuyX92j3vxrSd4Ww0Y72aiDCH/ROkbHFQ
	X9aK6k4b6ogwX6XRvJQMPb/FpQBDorlgV7kROTmHI+l1kHEHI7VTfFJPAE8tRWfyo8tWT5BAQbC
	qPAX/4mZ38OtkT10kmlCe/WtsOqNjyvPueACYXOkAyoe3LHl8Qxr4jJR7oGRM3czCig70uraCyV
	t/298HD6iybcr8qT133TYSaesOKTJqVxLQiKWH1K/wjpkwaMeasBzlUPppyxUcd6XyUDAEO00Gi
	w5wbONjNRHr5Tz3Ng0tTN87PwLbQJj8r2WiHXpNPsdMbqrC1mpDb2c488asE16ts1eB9yk3xhUO
	q4jtpEJHZ7sMW/lUJiMmK6HnFEpL33JmpoIdA8v5GpbtgJ+4St/JPDoIZwLgUkoht0/9nMKpwQo
	oshSdGZUdRoBiXk5davqDe4BpIzw==
X-Received: by 2002:a05:6a20:939f:b0:3bf:ecf8:abe with SMTP id adf61e73a8af0-3c38d512647mr21472934637.0.1784564246909;
        Mon, 20 Jul 2026 09:17:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1ddeb6sm43145565eec.20.2026.07.20.09.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:17:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 09:17:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 06/11] dt-bindings: watchdog: apple,wdt: Add t6030 and
 t6031 compatibles
Message-ID: <f0d4a047-5dd3-484b-9fb0-89c12bd93ad0@roeck-us.net>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-6-55b305833123@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-6-55b305833123@jannau.net>

On Thu, Jul 09, 2026 at 09:30:52AM +0200, Janne Grunau wrote:
> The watchdog on Apple silicon M3 Pro, Max and Ultra SoCs is compatible
> with the t8103 (M1) one. Add "apple,t6030-wdt" for M3 Pro and
> "apple,t6031-wdt" for M3 Max and Ultra as per-SoC compatibles.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
