Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13917A5A6
	for <asahi@lists.linux.dev>; Wed,  4 Sep 2024 20:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725482909; cv=none; b=WUqhWl7YxfBWc2kRHbIe9IT/ZNdVIdbklCeYJ37ieSyl0YlmERlyF3l36OftZoAqq/CVhHfa23AQ3WHblfZeIo0REDggyNmrePxLGK0O2rCOsHbNz+/CzaprsYVhscpDEVtjQiX9A0m3xz96Pa8l0Ye5lHcqDytI0bbGzmn1LWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725482909; c=relaxed/simple;
	bh=IlJyInQbVE7u36t+XXgKiK53ANBHKwwMMhwzf2pzfBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXULAeos2M4SoKBEWc8dJdC+8+/DIEQfmFyfiaYl2GNvGrM3jEQusF6u2DDNEUr4RV+rY3ff2YpYaPzWZEhFx1nqYrjNMKmWr+7oYozHMxHc9/0CMON73+wYaSyQEVeH0RRZ5IV4l0LmcDiiaxqZCg357kWzC+7GHnHasS5Xlec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SbAx30nH; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SbAx30nH"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4567fe32141so28021cf.0
        for <asahi@lists.linux.dev>; Wed, 04 Sep 2024 13:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725482907; x=1726087707; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlJyInQbVE7u36t+XXgKiK53ANBHKwwMMhwzf2pzfBs=;
        b=SbAx30nHwpqL5TnTkIqM2X5pr3A6uDufRcN7nayYxMuVHubAsSwfClwB/M5fHmVszB
         OCmLbFZdXNxhvL6wjM19lW1D4gqEraOJHyvD6G0mOBLSAnY46gJuD3OiFtbfNGpAiQe/
         cGuK/ZYakYkYdgqemaPFDA7OQdwy8R/d5w5rrooET4UtmhSurfQsDM9ZDEpo4iErV+9y
         ZNtnAXWD7/QRr+9FoWeiEz/TZ8so+faH43a3nHz3qVf/GMF/SXxzLE9H9rUbMGz6327C
         NMTZFWouRlaQ8E2gWrUGUHEOPQ3MlwFSzF/4d2DkOe4jXmuG4qjvBOZQ8lXQTgGbojz3
         ANWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725482907; x=1726087707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlJyInQbVE7u36t+XXgKiK53ANBHKwwMMhwzf2pzfBs=;
        b=kwpoUR7t11GDLf3gOvnCS/bgoxhKUO2oScboPTCkwo64WSJUzrRcsN6vVFIBR/15o2
         1bop1YwjwXuwO0JSSeHTcgYJnRSaFJSB23NM4srBoZ6jpesph+Kyp0ciJnjRWp/o+8qM
         AMI3Y69aVRN9K17Bl0KIx2fzoAshotb08cYvNp3aIjzBHcH2B3uypXeFrOk31oXF1QQT
         nEc7bGB3MsiotE1NvKBYKWevHH5Y+lZLUgtgLmJ76NbfLFs8mfL2qZf83GpGilpL3nrQ
         JCqqix+lt1Gman5ynni9E5QDCD5mFn/zWrXoC3POJQ9xCsylKV3eh1sqm6aS44QIEnhu
         AIpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZdaVmVVUwy5URJXI7BX71eN1vXdHyCXs7tA4hZ9xhJ3Id1ALjQjr20+P8eJRDpeN4dmx7Rw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQPfqRIrcWoyZ4rJOzXCRmQAmcyxmjGLKBgOOhtI3+rRkebjgu
	CsMpREUwoYrDt8a44B35LrIG6RL6qjy3u3jqWCpXv6PD0Njt9s8WFjApY+2j+NzqHsmnNGC31Fd
	ixj2d1mgkXSagvYcHZMxjVGG20jdyqdhY3Xma
X-Google-Smtp-Source: AGHT+IH29w72UxfNOmF+cOkn6nGTKhQJqTJySHQ6AISmMgpemfPBBYnt6mkLOYyAZK7vuhZ4wOocZ3LTTemcXVPpeUk=
X-Received: by 2002:a05:622a:64e:b0:453:581f:f29e with SMTP id
 d75a77b69052e-45801f21252mr1019391cf.24.1725482906905; Wed, 04 Sep 2024
 13:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-39-samitolvanen@google.com> <CAK7LNAQ4Qy-Z7Z2ads7JNRs+aTP5BrRTqCZgmm51e+_6mU3sYg@mail.gmail.com>
In-Reply-To: <CAK7LNAQ4Qy-Z7Z2ads7JNRs+aTP5BrRTqCZgmm51e+_6mU3sYg@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 4 Sep 2024 20:47:48 +0000
Message-ID: <CABCJKuccRnMAn4VUWjD4=2NXOR1a=wpHp-iNNUTv_Eh4e8155A@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] x86/asm-prototypes: Include <asm/ptrace.h>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Sun, Sep 1, 2024 at 10:51=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > <asm/ftrace.h> refers to struct pt_regs, make sure it's visible.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
>
> Then, why don't you include <asm/ptrace.h>
> from arch/x86/include/asm/ftrace.h
> instead of from arch/x86/include/asm/asm-prototypes.h
>
>
> And, this patch can get in independently.
>
> You should send it as a standalone patch
> to the x86 ML.

Sure, that works too. I'll send a separate patch for this.

Sami
