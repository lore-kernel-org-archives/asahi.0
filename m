Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9353154BFE
	for <asahi@lists.linux.dev>; Fri,  7 Mar 2025 06:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741328325; cv=none; b=mpZBxpxHxbTQHRML1/oHz32axtTUL1YOa4UNSv0eMdnXoXdhecpQPUigO0CI+a/H4T7AfJDhPzmEzqufRgvKga7O4aLOB5o10Hj4i+RygfXi8oww5WWqn1tRvBIllSyXR8XQwYNNy15qAOAxK+3PQeIUlOCn6CsE5IaZscn+hAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741328325; c=relaxed/simple;
	bh=1soUIkK5EKDYaH0c8vrvpJEpTwWQncZv9NclynqEpxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/1MgQ/h+eS+T2hhT48THA4INpwEoHDtUackheqVAFvsiwu65y5bFiDvfEVLMy7QOxFqItEnKkOOOp7x9Fv1tPo+Wew2q9gk5B38zrC4scOyjNJ2AL1VUbwVlHiEBs3JV2gh3zDcNA0GwPAI5xz3o6TDFnfqSeBJRW3ZKUoa6f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkTtKCMu; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkTtKCMu"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-46c8474d8f6so11848281cf.3
        for <asahi@lists.linux.dev>; Thu, 06 Mar 2025 22:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741328322; x=1741933122; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F10fia5s8BJGMmpI4HkuMx1Ala8TT6PDF9W24WMGIHg=;
        b=lkTtKCMuquwJP8PnzPHgVeAxsPoHftj05nhEXOQwI01ZQL/DcklmmpxavgpPwqqZp0
         n8CWHJ5rmuTK0jT45y23P8eJU7kyg2LBtYO3qFvTp9oMAjVfPj4bDceKRLMDU0RPczvv
         xJOwWmI5Gt39PcGI+rZbIZbJUIjg4yFlAHD2UBFOue1F7B9LmWCreS7nC/7nBbte5A12
         h8lIq/7JnZWSkrdNWJ5KPMrIqaP0kuPwo2WjjakegA5I3NAEGMdedZpEeF3OuTunK2Um
         b/0BEyRWh/mOTrWPVyy87keSzFx6mmB7Aov37Us7fqgOon/8USpzAuiKzeW8tX4C3zQH
         5OCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741328322; x=1741933122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F10fia5s8BJGMmpI4HkuMx1Ala8TT6PDF9W24WMGIHg=;
        b=vs5bsVn98nBSUkvq497aI9Fgtp2s8A9HigKSoei7KzxXMChII+rz007MYofomqo54j
         bSMxXF0/pGz03qFvhBhftNTxE66EFy3UASUdbLruUGC1b4jxhw7tihYvD2e0/8IqMDv+
         Jsk5i1gCNqOxYtARO/FIsraQXvV1YgY/s/9UObi5AIS/0ElJHR7/WpmychPFC168yF3N
         svHPvWg7Pxg5Ebtja/5yfnWQnZJV0gl+9QVii1ZAZavbRr2yV4XGdswgMVp50kP68Q+6
         feXSkYxbrzNXbXxiWbUCDzauRSLq3TVDlOBiJEgBUgZTXcXL/3Iz7jRAOajnwdwiwG7A
         nObA==
X-Forwarded-Encrypted: i=1; AJvYcCUa9nBO6oBSHZQ19j78WXqXxy4u8aw6AAo8SbfslMFBct1ZZ+DsOjLjA0K+MURQiXOn1BHWIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNxUHZH6iCFY6rsRTnsZM1m0nUpg7M/tUAJkqE8qawUc6td1jA
	JKNcKF5Q/pHPxSgRkXWWiVQeWzEWbY7lUGOrKDgyfLvIQtjRpClVPnXtkIXjuV8iVsj+404YJMZ
	svzzKtunoz7BXTaTAHheO6kn5Blg=
X-Gm-Gg: ASbGncu5kDQO6F9P418or3IvnavqBuCLYw70pz4WwMiltQLtDIYCRNVj6sTUPO09YNM
	dzRdFM4zm3NbMsookyn+Wi/9pla8XHAIoYDGmlMTfnsO5wSQgzZ2m0kuSF6hF+ydK4GB4zqNtS4
	3nF2Mr00DgE33sXu9InTGfqe2FKBIOtp4yCantSCxtXikKMzdsB4lyJyjA
X-Google-Smtp-Source: AGHT+IHhETGPw/ZFKq+YENLV2u5EcdpAk3T+SS5XFSamMDKfcKgYmQS3Mbj3mWKDGRDz4TBEKSSztO8xYHOfJx/qczs=
X-Received: by 2002:ac8:5e4d:0:b0:474:f29d:2e96 with SMTP id
 d75a77b69052e-47610978d28mr30024911cf.21.1741328322528; Thu, 06 Mar 2025
 22:18:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
 <20250227-apple-codec-changes-v3-17-cbb130030acf@gmail.com>
 <20250304135050.GA2485358-robh@kernel.org> <CAHgNfTyVKFuT0fZ3Qj=MdcXs67KscwkSepAH95xkAAKWM1g8Xg@mail.gmail.com>
 <20250305132239.GA1415729-robh@kernel.org>
In-Reply-To: <20250305132239.GA1415729-robh@kernel.org>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Fri, 7 Mar 2025 16:18:31 +1000
X-Gm-Features: AQ5f1JpO-lY2IBZyJ9phmkLFb8GGKVOf8HdEFFSJcTDAx0YxxJ5ZNijHlkAl-zg
Message-ID: <CAHgNfTxS1Q4PPsw520-J4Yn6xg+QZOYFkYhg5yv-uZFu5waN_g@mail.gmail.com>
Subject: Re: [PATCH v3 17/20] ASoC: dt-bindings: tas2770: add flags for SDOUT
 pulldown and zero-fill
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shi Fu <shifu0704@thundersoft.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 11:22=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> This just feels like something common because any TDM interface may need
> to control this. It's not really a property of the chip, but requirement
> of the TDM interface.

What I'm imagining then is something like:

dai-link@0 {
    cpu {
        sound-dai =3D <&some_cpu>;
    };
    codec {
        sound-dai =3D <&some_codec>;
        dai-tdm-tx-zerofill;
        dai-tdm-tx-pulldown; /* either or, having both makes no sense */
    };
};

Codec drivers would then provide a function to set TDM TX behaviour if they
support it, and export that as a dai op for use by machine drivers
when they parse
the dai link similar to dai-tdm-tx-slot and friends. Is that close to
what you have
in mind?

Regards,
James
