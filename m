Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8092FE56E
	for <asahi@lists.linux.dev>; Tue,  5 May 2026 13:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987068; cv=none; b=qrZ/6C433v9/FhJG4e9jDIUTALWgxByjtHkmTD/UalAm7vEOBEWAYp2MJP5TxtMO7b/X3iQAcBH+VH+ey+ylt2Wo8iyE3GqSf07778w8SjqhoodCatCUABNeDcXd4yP5DZCxic034UQc46Qf0tU8GK8axBww6X40fOP9T1eWnk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987068; c=relaxed/simple;
	bh=yZlednh9nVTM+xIY3GdlLz29I02HRrnjp3HlVqr0/w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHK2QEuUSUsuNXM+1qgJM9xTe2yf/mBy2czO59uszgL9bDDZpDaKY44RpsoN0OA1s3rEhrcGpP0SZOnMLBiM/WEPeVCtwM90p1dZJwCeCKVwiGbfgRkTl+pYgjBSJUnNERKCdXutdLEJu21950BiKrQ12jaAcjO/Mhf0HZKb3Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwF1krWs; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwF1krWs"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c45281a06so8167064c88.1
        for <asahi@lists.linux.dev>; Tue, 05 May 2026 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987067; x=1778591867; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+7Uwvr8MeFsSApFn56xtx5NITAqS9F0rWz+pR67Hm0s=;
        b=qwF1krWsqbFpOJQ/fFkKJaGboIVBEOGEM5ZH7jEVjnPyRpUyFhrhIFNbV7ocRMSdPe
         y1KVJRCSGdGslTM3w26d60CYl8x6Dvan4SMJHfnnzqCTWsZfCwOrQkqKAZ8Uz+jhvFca
         7O5nL3C5aNq4HvvJX69K8242aunu4XJhPQLgEqSKea2gyvGIa5BR3hgnk7BXjVK1Yewn
         XM4C2YI72Vli2WbWyvcECXpA/EbpfeeBmWOjKMhFkd9O/5W/+YxMxE1mt2aS6hVQ++I6
         aMa9BpruTqoSYyPFbvrUlXSQIZ7VbNBPTh+54sF7p+61EzkHAyqc4uSiOIE97J7L2Wbf
         nSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987067; x=1778591867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+7Uwvr8MeFsSApFn56xtx5NITAqS9F0rWz+pR67Hm0s=;
        b=MD+EORFmwSXK2CxaOdrw4gGHR1xOM4hEpWERQofraWRKNQz4Adj2wIGoesFTIoeiPp
         ceon6EdXhldMC+prwN+zjuNT926Ut0o/GN5w9ZPQKsSbar79cYhdmPIzavrnaTvRckHs
         o+O9E5mXshQewaVWysx3ocWY+hHiBA9AlhGyZqCOgyugnTKA2/W/OjNecY0GlmvX8hr7
         scIQ9q8J5xHh50sEdJ4RgffLEvZIH1dzcPOWykgt02hSWN2nguzwrj4EGLPDgdJarXTn
         4eHgXVJ+pr5jkinHEpAXjQkbiECGHFVC2ftgLVVZNKMLsPH2XFaVeNEVc1sO3oAbJ08O
         1Bzw==
X-Forwarded-Encrypted: i=1; AFNElJ9jLTdtMPw+PfoQlH6QMzKrH4wcVHIn1tRfKDiQnFjg7mturOoAwCbrLRj+5N94OY1uSbzXYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxT8g5tyTGSReIhY9ZN1mBriYhv97MQ2ODsi+CWf6f0DFK2kFbr
	t1jCXBGo5jxqRmRehs9ts9cG46xP2X7o+8snLHcPl/FyDv7jdbZeFxX7
X-Gm-Gg: AeBDiesPKxAVxssXXAM5lmqLlMspCGeseoiuUsfEtAsyWNd41v1+lq0R55Q90m4ftBd
	BHyTHCFiy78wExt8UpstO1e18QPM4ro+MfiPrft4JY+sWng/UPT5izuZVlsy9yETva+glY/l4MZ
	lb/4FwRz2RP+At2WnBDNjWs+wbaaD7ufBP1HQz1hsZGsQEGNdM/gyXBOAaKBqUFTPns9SSvXNvp
	3E/xPrK4BEHAo6Inb7EY/ToRN43cOEZnN+smEr55GK0CwA2NS0NfHxPlcl1vlVyx6DtoipCp5ZB
	UjHQ3uHYpoFDhZXUS1+1CPnAvX6b9bImkOtXTv5JZwKeJgF0Bf47zUKpfd+OpIZ79u0soKu7RIs
	BGy3NXgOQqnb2WjhQFAefPA4/C1v0nmJRySwTEwugoOVJSa42RvRBnILGsTWAT6mQOxx8vQckLd
	e1UAwAbqe5OYt7a3yhRP0eTw6eaOvoOL14Ajs7uh1ZePnh8kE=
X-Received: by 2002:a05:7022:238e:b0:128:d352:bf8a with SMTP id a92af1059eb24-130b1c72299mr1458737c88.33.1777987066539;
        Tue, 05 May 2026 06:17:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df827a73fsm18173052c88.1.2026.05.05.06.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:17:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:17:45 -0700
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
Subject: Re: [PATCH v2 3/6] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
Message-ID: <5856030a-4d3e-4d1a-928b-f9aa0b21f1a7@roeck-us.net>
References: <20260505-apple-m3-initial-devicetrees-v2-0-b0c2f3519e0e@jannau.net>
 <20260505-apple-m3-initial-devicetrees-v2-3-b0c2f3519e0e@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-apple-m3-initial-devicetrees-v2-3-b0c2f3519e0e@jannau.net>

On Tue, May 05, 2026 at 01:02:41PM +0200, Janne Grunau wrote:
> The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>

Applied to my watchdog-next branch.

Thanks,
Guenter
