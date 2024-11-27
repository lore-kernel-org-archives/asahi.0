Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195BD1F667B
	for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732706618; cv=none; b=JGPVN3ERBBaO0rB1KQjybC9tMmGj/6239IpdhaBkaQq9qJL9mU5QpDgxDQGNJQhBtd3eYZOr5BeY7kyUTpQMfc+jBoGqJKycxtgSBCJp+nf/3j8BFyl0y8zXAb4b5bx4o4Mi/A3XLiW7Vir4Iwjn46PncKe5xwR6hbNhfyBD5/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732706618; c=relaxed/simple;
	bh=RFNJVebhk/P2gt6mfi/joxjoUyYMV0WKr8Mcv1smVno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WjfyPBCy+7v6HlLdCwC5NnoPD4i5VA6xkTjFjk+RIMteX2fgYGNV615Y2MAitjz96QEiIdfYx8VXbCK9+fnn6AZNthdOU+ILX8GAytx5KH1PdgpWBssQnwWLJoFENsHZavkibsElfr0F/Ev4bN/HX2PlcSQx5NtEexMvCOHtoGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGBZSluU; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGBZSluU"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e388503c0d7so5454895276.0
        for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 03:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732706616; x=1733311416; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RFNJVebhk/P2gt6mfi/joxjoUyYMV0WKr8Mcv1smVno=;
        b=VGBZSluUxY14kp3fJUjEwvfScZyaLADqJSmoQFDySgT9FPFmnMGwb1ueXGXjJSORUi
         hnKAoPmS+/iaDkn3N+JyZBO+r6KgIDlScRtCXaLJYC/t6/c6B3RLSNngEDANe9XwQk+z
         MgZtZaHmcO4ZStMzIyE1VsCH39qtfsVjLPoD19EHFac+yk5EllZz7xEcrOe/eAl6Cta2
         j/XUMe5QH6eseVMZsSIO9oZaokv/6HI5BGfR8GCTWxGAbIAQBxCoFERcpdg3gODyPZBo
         Zh2J4Dyn4unM6gpVKdCU4Gc8QWdtGQaRq/NtsVYM4mArvzMflWbuIg799Cqv2aUlugMp
         r5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706616; x=1733311416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFNJVebhk/P2gt6mfi/joxjoUyYMV0WKr8Mcv1smVno=;
        b=pLP2i3DK8UnNkVwhO28VlexE/L67HwEB5gpg+2jjX5LHW0echJKrj1KOtcJQDRmcgl
         1fq8RspVUM0tUxNgsRWuX7vhN9UDBxTM/Gnbx9dvK1o9xsoGTyzJxtcStKjC/0kKPZ00
         BdRejJ/CfcaU94q1y/1CJZ+bJ3S6XhUjsXmlao/rypM6H6C/23cMdg+BD0rWlthiuCCj
         yHK2//yxFTWpHPhA7mbu4FPRVtmY1ViO/VcOflaKxbcAtNcANduDh6aVQSmyPplVnfBG
         u4VMZjvVKSsNOBFEcXl4ZHYB1Q14MhlJ8EgDX/LnFyUc6CEBeS+WJ8guPPGZnebPcqqX
         PqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWRCxeBzM1h28nGYDNRzs+KtqaXGQ/nNZu0I9IWbGsHgx6QS44Bj4Vdudd1twa/5DMgzqsmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxR15O48bg4brUmxFfp7iaziGEO7DURcwCvp/8cHuelUeouNA+X
	zDeba8bn/ogvxRX1afbIz0Hv8eicP1YVCjGwyz/Ezx++SB6Swy3Ei2pN/FY4eQgSFDg+hgzLtu8
	A6siKAka0w5KyKyh5f0tmO0cAvd4=
X-Gm-Gg: ASbGncvrVysv/7WKtH2d7Lei9QQTayyhfqQnc1fi0RoF3jsgtN2snUERVhMNilzbtfb
	vE1ZBc/sTL9h5+hAer244fiaunfJ6pE93
X-Google-Smtp-Source: AGHT+IEhGTSK2YNdXdDE1bxdAMUSkkOXknhoF5JR5lXJjT5V65SSPE0rinZmMub8wlV/7v+m+94VpiBh5uSV13rfdCg=
X-Received: by 2002:a05:6902:f83:b0:e38:b87f:52a7 with SMTP id
 3f1490d57ef6-e395b8b96f1mr2630271276.14.1732706615983; Wed, 27 Nov 2024
 03:23:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-1-c43c4cc6200d@gmail.com>
 <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic> <CAMT+MTR46HbUJWQOwG+MY8OffquekynUs_BRCbuAosLrmc+smQ@mail.gmail.com>
In-Reply-To: <CAMT+MTR46HbUJWQOwG+MY8OffquekynUs_BRCbuAosLrmc+smQ@mail.gmail.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 12:23:25 +0100
Message-ID: <CAMT+MTTqNZuaeROufzA4p6VS0QUt8pJ+3rA3t7_BX1nW0ewB3A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: input: touchscreen: Add Z2 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 11:49, Sasha Finkelstein <fnkl.kernel@gmail.com> wrote:

> > Why is this needed? I think it is not part of common touchscreen schema.
> > Drop, devices do not need labels - node name and unit address identify
> > it. If this is needed for something else, then come with generic
> > property matching all touchscreens.
>
> I want some sort of a property to contain a human readable (ish)
> name of this device.

Actually, nvm, i think i understand it now, you want the labels stored
in the driver and set based on device compatible, right?
