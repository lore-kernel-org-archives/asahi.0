Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041E325767
	for <asahi@lists.linux.dev>; Sat, 27 Jan 2024 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706366416; cv=none; b=L3M93MGXD6rkq1d4dRGljP9t18pPUFJSxDURWUCBRocPa8l4RHVVflbjZFfWvA2cU9guondNUSBgCxwZ2ut4tyCBF9FZR8AnR3dDXFc6XP+Ow7nGXRIxghz0Vfoq/sYQBsw4kO2MGO+ws28Z6XSbEq4S/qIeDNRvCQcmT4Pkg88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706366416; c=relaxed/simple;
	bh=/e477vMpDXc+jgEqZ+V5IqXnYe+/8T7rddzTw5mWhvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MChFPiwkjUjkBUBJKSpDF6ZAN93elfOG54JW9sdavl97qLsl+cS4CmLQ90G59tywLzuoEfx2X3mj0pxCx78A9i5oGEW2MuPKIpVUTDxQ7qDWN7jaSMsbI4f5byOHXzC9G5KSoB07xnQ7akFJgyfol5bcZh61m8ZNwj+0DgcpuX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WD4c0Ns6; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WD4c0Ns6"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-510e0d700c6so54301e87.2
        for <asahi@lists.linux.dev>; Sat, 27 Jan 2024 06:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706366412; x=1706971212; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jNR83EdJ/hr5bvN1R2INUkjJh6swu7AAKIl4CRoVlzs=;
        b=WD4c0Ns6uknh6Cvb5U0Z1/R9oOh6ZLhn0xrfUpABkcwdkt+9aFHiUvxZYX4T90YKfk
         N1WZFHxyOSTTYx6OUXKt5YQZbo0nrFqA4wGoO8S3XD+IiNR3emgAbbEQhkiHN00OLeIr
         Ay9GlJcwd+tYheNdqlukJ0MwDHwnAs3vHa70PIa1zXmhZgZh1T/HDrqVQ+mnMrFoz7Yl
         Uz9fPTPnGf4FGd10qAU236cdMLpnjZisSmX+Z9+vtz5obRUaGurcTfe8GkagiSsVTh4l
         PHpQrJlnolApVOgR87saSrjpm3yHiy0gDPn3sSu3PDwRI71jIWbL5Pso8+ftO0aBP5sd
         qFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706366412; x=1706971212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNR83EdJ/hr5bvN1R2INUkjJh6swu7AAKIl4CRoVlzs=;
        b=UnEOSz8DO+pMbTXalGbtGrJtk+wyOvz959IXNLrai7sYAnP0TH8DwtpnkJk/d/rrRO
         AzsR4kRX3PoS8+mZ4hhuzVoQ4TfJklQWPdjvxe5ymvJkKTXUd/SLQzl34KAaDX/rwXuF
         IUVOLEuesv+w9Kk2IfRSOihQeGv/CVUZI+7+tCU0JPM/+hhowTY0+CG2+/NW7GtaJ7j0
         zLsU4CyF4pvUYA70+QhoCR/hBhs91PyxY0MMvBErtnIeqMjUSWdulbjbdnItxKpmYIXM
         0JvLWOs7PoyHAtslEoIF8AnINUw2WzjdiR8whasO+WXDXjAMIYS9ZLS+J3wrF5GLf4bq
         FKYA==
X-Gm-Message-State: AOJu0YwsZ7E0RChPdVbVJCGzydd03zO1tzJ0m71lu3yx3TcZJw+0qDpJ
	NttsHpApxh2+R7QUBzfWA+mZLIUuMIPJVh+/cqE99+rqpKCRQWho90tYG3s8
X-Google-Smtp-Source: AGHT+IHeEyhyVe/etn9HHo9JHv4CgyrsrVnhSTiYx/D24ppuGRI1lcawt1rYRkVI/XbVaPEAcnQssg==
X-Received: by 2002:ac2:538d:0:b0:510:e05:435a with SMTP id g13-20020ac2538d000000b005100e05435amr1017070lfh.26.1706366411691;
        Sat, 27 Jan 2024 06:40:11 -0800 (PST)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id u12-20020ac258cc000000b0051021430798sm515314lfo.31.2024.01.27.06.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 06:40:10 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 40REe7oF006062;
	Sat, 27 Jan 2024 17:40:09 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 40REe7nv006061;
	Sat, 27 Jan 2024 17:40:07 +0300
Date: Sat, 27 Jan 2024 17:40:06 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Hector Martin <marcan@marcan.st>
Cc: Daniel Berlin <dberlin@dberlin.org>, asahi@lists.linux.dev
Subject: SAE AP on BCM4345/6 (was: Re: Testing bits/080-wifi on BCM4345/6)
Message-ID: <ZbUVxhsrbbjhOd0+@home.paul.comp>
References: <20231107-brcmfmac-wpa3-v1-1-4c7db8636680@marcan.st>
 <ZYK/C3LzK8LMOjER@home.paul.comp>
 <3e7f9763-a481-40d1-a5aa-9d71ebe13d98@marcan.st>
 <ZYa2Q8ALPbr09L4b@home.paul.comp>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZYa2Q8ALPbr09L4b@home.paul.comp>

On Sat, Dec 23, 2023 at 01:28:19PM +0300, Paul Fertser wrote:
> 4. AP mode WPA3 SAE starts and beacons but connection to it is
> impossible (probably due to a user error, haven't tested much).

This wasn't supposed to work before [0] so when testing this feature
make sure you run hostapd from git.

For the reference, I haven't tried it with your patches yet and it's
still not working on AP6255 with mainline.

[0] https://w1.fi/cgit/hostap/commit/?id=b089803091cff61e253e09fb560c7ef7a336a611

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
