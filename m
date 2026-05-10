Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BA039EF2F
	for <asahi@lists.linux.dev>; Sun, 10 May 2026 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778426984; cv=none; b=usxVwoH1kyrgE5t10Cxejt+4Cl7R5n0qYSGteZaa48DMH74S1OwR2R0jOVH6kmTBsgQ3XxA9V1/YeCo2ryh6O6jvx0Vp4EoLoxABqCo2Psd1U8zqQsILxKHOk4kw5B9J3Kd7Tti0mvQ268EE8GZO5+1zFfoTZK9+9j77QgV1EiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778426984; c=relaxed/simple;
	bh=VGhBlR4i0yiBkTCF4XD51IEzNUwKDosxwd/fQ1UG4tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwfFDwdYc6ZB8KvUz5qmlNJiFeRQxVqDxfGGqVTWHot0R5rhDrur5KQmN+R9hMs4UUWdLjB92103O23AXB7l3in0iWkFF/j7rluEN3EE+fA5HWPy6sOdNs8ko8uf0b8f1lHxJoh/pFGQjePv/hrTPpmRT8Tf/Bz16qVfMNjQjXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfoASXYV; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfoASXYV"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c15849aa2cso4271951eec.0
        for <asahi@lists.linux.dev>; Sun, 10 May 2026 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778426981; x=1779031781; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qigH8lxO+eZS/TR71vYkcB8nPKNDMGG4EcHQASbQAqg=;
        b=WfoASXYVnepUqRhX3eu3oUcnIomd2gyMH8ONjabMKiJqFd+Db4bpOyhCUe/T8HLrM8
         fzfiqpZJVslezZ8vFzKt9Zx8lO5W5rQ1O8X4IZxgRGf9651o0CWgUKOIl6fs1rMQGtXL
         0jXJqTFLd+8fnM2ky4JhbMs5njtQBnpElQRYsJA7C0yMePVhhJxrOJrNhli+BIw/mRLz
         9vpMLQM/dN4KbM49J2ayZzNgFuUJgD86aKY2F48yIBIcy5Z1BAnzV+B70ww9Hm9SSu7N
         f/K0wwd3OlF5JZgv4UWgox5MZI19p1e6DSwTE3p9u1kxLYjR1QCea4AbBiOE+zXj+ybv
         6gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778426981; x=1779031781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qigH8lxO+eZS/TR71vYkcB8nPKNDMGG4EcHQASbQAqg=;
        b=Vs8p9YIG+jEm4qxFeOB1Agvx4a9FJTmvvzj+BqwCHYSrBSThxtA2njoND6JkmDjj7k
         DKjiCptqAGaQW4Zzb9gPCw0zxWl1TvT2NzoS768nlAk6zDSQD1Mt3dkOed6Nqbu/Q0uD
         xgtVSJ05TA0Q8LjiAz4mRxRfWlAo5JwDwDsQNuJtQ9vdW8DZgR5kgEj5eXGs+fELM6TL
         D6Jo433d6DGyMu8lm++U/i8Qaofzy7MFgp7TaKx0IXbGPqwL5chF0sDJ8FnRsWeIUgD4
         PZaR9XNvLoMD6S/FclNm1Ay2QQv5I4s2KgrXz4oKNtqhkHNrEl2aZ0fgOuDvHoR/I2qc
         xy/g==
X-Forwarded-Encrypted: i=1; AFNElJ/gzl/B3TM1bgHlPZcKBY8QCvUn7x3EANbzM+JHHOKurORLBAjwsRzGg31fQLr/AfwjPdGooQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yys3320wb8uF6gcNiCgQM4qa2u3kOBb8Cp9plQZROmWCaZ5BoBD
	BPL4LkVxSJZUkCAcx5IuCyBdwxRu3Gr4MsZIicwym2gLubYV7p2aG0TT
X-Gm-Gg: Acq92OHopuoHZw7oG9FXWFqGxQgOwzDEDx7THYBJ/4G/p/AxJ83EfbWYUXxKtik2YzM
	rxW9pgeHMvaJocJXYumcErv3BJRZc2U85OFtYI82mJivn13ce1LQLn+Cb9mvFF350BOvyIIwM29
	XAUmVjMnfRR9P5gl9VGwyXQ7F3gnlKkN8oCvHODOpfVuQL6H4luJ/zGYDKP0lrKova0+PZVtFFw
	cbYdafhF/z9QyhsxRZe111qL/+0LicM3jTbLXgEdoX87mfpY7WG4O1R2Xxf999E5bM/BnJTPWyW
	6aEHF4ibPSjVB68vhEbRH8XQ2icAxnG7OSR8SsDcEDHDCkYBoDDP8xCB6zbBpqTkBu9QFbRVI48
	JYPBD71uVZJPimvfPdLXgpJ+eoZXk0ID4EfT52Yr+wA8o/vfj4rNb3HFiMOt0dw7wYJyV5GFs6d
	LFpWXWrrHWmtlXtiLwXfoX+IXbQZ9SEmIrnEomVLCiqtPwwoc=
X-Received: by 2002:a05:693c:300b:b0:2ea:5057:a2f9 with SMTP id 5a478bee46e88-2f549f7c2aamr9650588eec.16.1778426981133;
        Sun, 10 May 2026 08:29:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm8525864eec.0.2026.05.10.08.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 08:29:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 10 May 2026 08:29:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
	Joshua Peisach <jpeisach@ubuntu.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
Message-ID: <85ea46a7-1136-4ea0-9eec-7dfa465df20b@roeck-us.net>
References: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
 <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>

On Thu, May 07, 2026 at 09:33:08AM +0200, Janne Grunau wrote:
> The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.

'"apple,t8103-wdt" used by the driver' is not true. The watchdog driver
only supports "apple,wdt".

> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> index 05602678c070..845b5e8b5abc 100644
> --- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> @@ -16,7 +16,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: apple,t6020-wdt
> +          - enum:
> +              - apple,t6020-wdt
> +              - apple,t8122-wdt
>            - const: apple,t8103-wdt
>        - items:
>            - enum:

I second Sashiko's findings that the driver will fail to bind because it
only supports "apple,wdt". I would not mind and apply the patch anyway,
but the statement in the description is just plain wrong and thus
misleading. Please fix.

Thanks,
Guenter
