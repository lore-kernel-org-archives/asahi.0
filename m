Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3500336EA93
	for <asahi@lists.linux.dev>; Tue, 17 Feb 2026 16:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345590; cv=none; b=mA0koPK1aYLzmFCyXI0lFmqsl3BlIhIMAAL4Z/pTwXvwwqFQJkZrwjWyk8TJdya9VJDvvQ+xXZ8imeJdLwsM43DWWc+Cd+kKBy/PPO3VWsGEB0uCc5t8jUcK9tuyhNGqftALJ/nSgRiC5MrR5vlD4uUKTfFEmqTC0LM+gwiY/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345590; c=relaxed/simple;
	bh=gb46PcwKOjZgVpxueuCR1R4DivfMoXbIy2Skseq0pzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtOiDu4l//ertnMbDYkeIqq1AS2KkOZTQuQk5DW/CVZ13S/Ya7vsedlr8XANAvOcIzazBUANlwxnvfF7M0PBhf+M8QnLuQ415C4laIsVd5YebssgGJWfTyGauMrx0FOvMeVSPzYdixvU/GuToatH804LoxDZb0pKaYutJ2l/T4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RMr5kexC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RMr5kexC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771345588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gb46PcwKOjZgVpxueuCR1R4DivfMoXbIy2Skseq0pzc=;
	b=RMr5kexCTnoitS3uI8I2dU0bzauQKVvM19uCAS7mf36UpYCCYxHu5d9oc1V5UPOy3w3xGw
	2BkrYQ/EbzVTWVHNpobK43BIytmongTx84R6ixuvtka445yWPbzWtaKZcC5MaGiOiuZ5qV
	6YMh2YWnWeo9SpzyrsA6SjoMbJL0ccw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-kOqe6lOiOB2rNkG4HP1q0w-1; Tue, 17 Feb 2026 11:26:24 -0500
X-MC-Unique: kOqe6lOiOB2rNkG4HP1q0w-1
X-Mimecast-MFC-AGG-ID: kOqe6lOiOB2rNkG4HP1q0w_1771345584
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-658b82db041so6011136a12.1
        for <asahi@lists.linux.dev>; Tue, 17 Feb 2026 08:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345583; x=1771950383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gb46PcwKOjZgVpxueuCR1R4DivfMoXbIy2Skseq0pzc=;
        b=uito//7UdX8Rv2MyvZb5qlYDKM87ItveFmZyWKexbm4VI+eBKF+t/wMz3Tcbyr/cII
         WrIyKP3uOlMQY0B92AhjEOwMcJ9QL/q5hzVeGasAPzwNGS0RioymF4uoAVnU6fVgYo2v
         uEikRHLHfdmvHtrosYMPRLRbGKdKvxFBH6tc7jGNOJ7sd0HjSyapcC932uurHDvrFSxM
         OC0l0wSqs36d+IWVmskVF9RCZojn61hv5kbEkUNdZ1B6po9hvxKx2b1WBFA75mCR4xhD
         r1lJLwgk2AhLH2omA+KXv68d6OE4cUf1asJ+QttV7HSx8OHU3vb9wMnfDO3wiOcEYIDv
         vfyA==
X-Forwarded-Encrypted: i=1; AJvYcCVsrb605asPAsXjbC6s78N4gWHyM2MPYTjvOySkIy5F1AztRB6SWGkCSeEQKdxN0vgVEyEBfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuEP9RB8s7vsxpmZqikk9XlkORhWBq/2CWQdevKaAuw/6GgyYT
	CVSyStt67fxEpElpyCe00S2tZ5r9uRBsSsgqDpE0iLYmdi/2XMg9l6DV1Ky9sVARvoV1ZPM4FlP
	uEB1L+v5A9WcJZrAEGYHzA4IlwJ6H4mxzmMnG64++EUqYMaO61Gxfu4Sgl2Janjai5me2YvEkJe
	OJmLls939bQXU3aJt+3UeT3dbYGZe093I=
X-Gm-Gg: AZuq6aKzeA1vkWQSDysl20dpriDR4hVvUzCgrROhe0bnXUE6+vHtNEstav3yqptMw1T
	itNlcxZqgY53mdLba4Lw25IGPkkal7eVk9/RRCBwmi+lXq9TcGZo+G2qjWIoI/HjDmI39kVFzhQ
	dn2CEq+cWcap4vYekaiWg7dtk0fdJWKcRuXerT5ozgmmj5JyA25SCGZ24SHPob072LUTyv3++9w
	LGI5+4=
X-Received: by 2002:a05:6402:5254:b0:659:40a9:713c with SMTP id 4fb4d7f45d1cf-65bace36a55mr7422692a12.18.1771345583627;
        Tue, 17 Feb 2026 08:26:23 -0800 (PST)
X-Received: by 2002:a05:6402:5254:b0:659:40a9:713c with SMTP id
 4fb4d7f45d1cf-65bace36a55mr7422653a12.18.1771345583183; Tue, 17 Feb 2026
 08:26:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260214004314.3787727-1-tim.bird@sony.com> <DGHCVCRACU6X.2KYOL2RQWEUG7@maslowski.xyz>
In-Reply-To: <DGHCVCRACU6X.2KYOL2RQWEUG7@maslowski.xyz>
From: Richard Fontana <rfontana@redhat.com>
Date: Tue, 17 Feb 2026 11:26:10 -0500
X-Gm-Features: AaiRm51AkDDvx3UrwmQbESVGd_4q3_QQ9Fam79zJStzxYIszji5egCjive5DA_g
Message-ID: <CAC1cPGwgwPJUssJwtUmVydXEGeL-3vD7h2z5_Hb+4g=mYJfhHg@mail.gmail.com>
Subject: Re: [PATCH] sound: soc: Add SPDX ids to many soc files
To: =?UTF-8?Q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>
Cc: Tim Bird <tim.bird@sony.com>, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, 
	broonie@kernel.org, povik+lin@cutebit.org, david.rhodes@cirrus.com, 
	rf@opensource.cirrus.com, cezary.rojewski@intel.com, 
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
	linux-spdx@vger.kernel.org, asahi@lists.linux.dev, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zWIPxoeEDpLvQPBhSQeK7SM5Cv9jhV4yls3XwYmqWs0_1771345584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 11:00=E2=80=AFAM Piotr Mas=C5=82owski <piotr@maslow=
ski.xyz> wrote:
>
> > +# SPDX-License-Identifier: GPL-2.0-only
> [...]
> > +# SPDX-License-Identifier: GPL-2.0
>
> Is there some intended meaning behind this distinction? Bear in mind
> I'm not a kernel developer so I might very well be missing something,
> but AFAIK the `GPL-2.0` SPDX identifier is just an older, deprecated
> variant with the same meaning as `GPL-2.0-only`. (Just like `GPL-2.0+`
> which is a deprecated version of `GPL-2.0-or-later`.)

Several years ago the FSF persuaded the SPDX legal team to deprecate
GPL-2.0/GPL-2.0+ in favor of GPL-2.0-only/GPL-2.0-or-later. The FSF
viewpoint is expressed here:
https://www.gnu.org/licenses/identify-licenses-clearly.html

Personally, I think this change was problematic.

Richard

