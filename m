Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009E519DF6A;
	Thu,  6 Feb 2025 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867639; cv=none; b=herUoRtVYbcb0KWWJiqkoNVMvhfo5aARcX7QX66g7iYNxN514Q3+S9cXSq7Z4JQZuwWBGoImDJF94B91lJM8y0pieCkDfBCMq+a9MwZVkId7iTSPnAkByc1aTdKt97GNuWdXZ846v0x8AxbJzam86CodZtcJlfWQ3Hy4oDeHJfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867639; c=relaxed/simple;
	bh=3CvL0m3jkteHJzzDFzIlb0Nrs0vGU0J7sc6PiQdecbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rq0o/lThQCnzlkxP947hfTx8N4x83RBN/RW/tDdcsAgOaEEd2AfL7Z2rck5fffgytxsorBC+nEbHBKN9+BSd98+aKamSrg1dpXgJ1RTsnGC0oTcRIRVjebIce8hveOXLZYur/xUr8Byids2pAO3kErKgMToUwznytwwuMy4bR0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab78863c312so16588766b.3;
        Thu, 06 Feb 2025 10:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867635; x=1739472435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CvL0m3jkteHJzzDFzIlb0Nrs0vGU0J7sc6PiQdecbo=;
        b=ntSwiHeBmA3lEE0C30EiiU5CblMahG0pX5antmeD8s9tXHXZrBcv+PSLS4yto1Z+F9
         AM1yksqN5cfphaBI7+C7ifPYshI3VPD5KdOti1gPkvUIiyYrfFSPjsXYJiV4Oa31K5qP
         twt5OChC/OSJpazdU1gHzu+17kjGPhSvPUxjlaQD7P7rSEuCgt8L8XBOn4pbPBWAem/v
         uRnGoSAUZP+DWyc/2HGnGf5SA94Lf9MRoXIMdhl/RB6jTMx/FrcOuJ3ZwxUjbDBhF5JR
         XbRflhA3nG9YQV6zctWWmn2WLjIqs5cZKEspdldZ6DGLuBtsUynfZ+SfLjpfJXe+Te/2
         B4BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVenLgc/Z5kgfyErfbjeFMDJLFewqyfUEOXyTfcsOzeO2IMuYOWD39fZCORaaNXQkg+DdqRSQ==@lists.linux.dev, AJvYcCW9UJ6AMFRvEt/wuw6yamjdH4twxpWiWrQzSwM+vywMfcVmiQO04I23Q6kFvIFETuMdYVmi@lists.linux.dev
X-Gm-Message-State: AOJu0YwrqJcA1yhhPprVQdBRH7fbmWJk7MX2vU8SNoP+7dZA/qBsRtIw
	QUz8fmK5m2IltqRpD3mo4+nLkPqUQSA+6eibo5Mw16tyNqohAvU5Z1Ru7q0c
X-Gm-Gg: ASbGnct3dFH+upbpk/f0SaYXHIs/T26D+loNu1UG5kAXhkt+6hGBeCMLoW8UkPO2r6A
	pKMCNuWxvEafjNir7QlMLVOp02HFLySFirp/1vGSPw9Ze/NPQV4/2j3PXnpPPg3ZY14plPf0jeZ
	8VxprBaX5Zzqw1DoXsJVZ/07fsvW6iV81r+NCyfkQ0SKQzN9ijhSek5UEPCeOdkrjN3jpTBf9by
	MZTIl3cNyQ+pKRB+8RPAoQgcb5qSe7xaksmxY1MskMr0bpyL/G25AN5uRtdReGGUidlnFqF/ZE4
	L0i+Vf8WRvq5W6UruaTBeBgrEwh9gvf031fG1lsNHpPYOQ==
X-Google-Smtp-Source: AGHT+IHLwp9HVn7y3aVZrXQIUFiaZzVVINMlUTv+hs5UyBR9CGlJXtnS4iVKG88LHlSyyn4dUnVKIQ==
X-Received: by 2002:a17:906:f59e:b0:aab:8ca7:43df with SMTP id a640c23a62f3a-ab75e346689mr814177566b.39.1738867633484;
        Thu, 06 Feb 2025 10:47:13 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e71c9sm138098566b.93.2025.02.06.10.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 10:47:12 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab77e266c71so103469366b.2;
        Thu, 06 Feb 2025 10:47:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtSXebcAnUv+l4Vqu0lEustU0pm6rQXs1AlLuoVGgF8IQp/BSU7Pbqg9VxDNqd0vyfjST0@lists.linux.dev, AJvYcCXj7FLNl6ZnYnRzsj6/ChwSdtiju4ZcHjqgpZcbzw+Jmu2KyJn+uCep3HP0Wvj5lhjtuFcW8g==@lists.linux.dev
X-Received: by 2002:a17:906:f59e:b0:aab:8ca7:43df with SMTP id
 a640c23a62f3a-ab75e346689mr814172966b.39.1738867632761; Thu, 06 Feb 2025
 10:47:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
In-Reply-To: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 6 Feb 2025 13:46:36 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_SSTiiq5R9hce-7j5W02GaQqNUj=bFH+FwgjjxWugFqQ@mail.gmail.com>
X-Gm-Features: AWEUYZmC5-xQFpWjOtuSomVEBcmsdobu2wf8xt_sdgJzDJ8BCc8mTMFpWqGxYDE
Message-ID: <CAEg-Je_SSTiiq5R9hce-7j5W02GaQqNUj=bFH+FwgjjxWugFqQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove myself
To: Hector Martin <marcan@marcan.st>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, soc@lists.linux.dev, Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 1:31=E2=80=AFPM Hector Martin <marcan@marcan.st> wro=
te:
>
> I no longer have any faith left in the kernel development process or
> community management approach.
>
> Apple/ARM platform development will continue downstream. If I feel like
> sending some patches upstream in the future myself for whatever subtree
> I may, or I may not. Anyone who feels like fighting the upstreaming
> fight themselves is welcome to do so.
>

I'm sorry that it has come to this. You've been great to work with in
the Asahi Linux project and it's unfortunate that it's been so hard to
make progress in upstreaming support for Apple ARM platforms. I hope
that there's some reflection on both sides and there's an opportunity
in the future to rekindle and improve the relationship between the
Linux kernel project and Asahi Linux contributors.



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
