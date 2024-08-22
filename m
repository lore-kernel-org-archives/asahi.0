Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B3A1CF2A9
	for <asahi@lists.linux.dev>; Thu, 22 Aug 2024 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724349482; cv=none; b=pNJmYhlYYf8FvYtCL9HcKPYtcx07pn2U6Pmxc6Oiv/V6+IWD95qz+B/GA/FAKkBv08OfesXtzEfciee0mgjkrOt74YvBiI6LBMAhh9lgmr5dNcnD9TsouixDsSnnFQ7WBfGnN+85HTC/idFapm/FSQLYD2vIpkU+QLESaWt44tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724349482; c=relaxed/simple;
	bh=AyQnYoPe6sf/wSyLAOYvZiLsLlNC/z1c6uDn8wvCjt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVgTyzSoUMBHUpNTBFYaOZbIi5QcE1M6fO2LApTJ2wYxgiLAzfccmAmhW6/HyVDBLBItXcTcGzHgw2Xpe4CrDeZc9OB5oATegmrdPJFCQNwRrIBQW2k1bH+oIzsUzieaA9jm9FDIdE3oRoVZgk6/ZIsnX50DNHyVPU2NR+Y0Y0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mf5Uc54I; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mf5Uc54I"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-44fee2bfd28so27511cf.1
        for <asahi@lists.linux.dev>; Thu, 22 Aug 2024 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724349479; x=1724954279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOajGVKCmpE5kmdw/T7Qp/wNBvNSdZEW8S+OXk3bvwo=;
        b=mf5Uc54IWiNqBwAHVuQW7ClL48GwIXQXxfU53JvUNGnIDX9Mp9wfaKi76sx3e+gAw9
         ZIko6j7TJvloyGFOSNDqiL3wH1Vz6yHq0OBwAyjPAE73KM3C4gV/W74agEjuJ71m42+X
         hr9l6m3SH7hfIU8Mc/96q2pNB/0q6KrBP8n68zhgRsXdpatDWt286zuX+TBY5vjbGlDk
         nS5c4xxTa6y37pOcMwQmCp/2goL68ONf2hj/K9oMoXuJvHv4c0bzu417fUNh5rHhpy0A
         qFJ9zsyaANracVPmzSi1//Lq1TMykotxknDgLni6QGodPU2J117UVk0ospewZYA1hpiJ
         jY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724349479; x=1724954279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOajGVKCmpE5kmdw/T7Qp/wNBvNSdZEW8S+OXk3bvwo=;
        b=aOtXh2McTEw5lchuIBBtielw+hLrI2LMWSTFO6neyRm9HuTpCmZc0Dr8Dldm/7xIC3
         /vzCB8U+9ZdAtX7TNBnvs5d498yRqFOf42lYtJLBM9S7IHWtMXGGtvS6HaXNuBu+XcWK
         h+JJdiY+zXjtOz4U9QUwfdWGtDa8C0yvKpujQsDv/Bj86M+aYf9QHh14o/3Q7NqvKHT5
         fb7Ow6PLAQhdzMk9pQgCUzGQTisS33r49tnj/dBXQvoGOvXAAvw2uC/zKFTvghMFAoMV
         K9GAEY8VVwmvlvehHAm2mXZwBNQj5UAc/woO6vReC0JBVkP9x15HOSAQT/alc0lTvjmZ
         odFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbCYi8tFHYSG51il03WsWJInpL2uXPLRgj3sL9C1z0GBXuCOMDVVfK35VLBXWFGlEZQHjuaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFpKBG9ntWMFNC54mbEcdyXZaXsncVk5EJugD/EXgca37ymlUs
	/+uHiZBegDw1I0FmvhSKyGWlWSUEe3kSs65dYhVq9TqeX4rMXyh/oSa1hE/PNSivbh5xGfGmTrF
	LBkULi5zo40BEa0lccjM47Ovi47e5vjoHhzik
X-Google-Smtp-Source: AGHT+IHpOQGA1+Xvu8VfAIHeP2jPYfCEPVVyYq8ryHdwZRdhtAaz9lpYz6WE5A47PoBLoqFMm3zfFnuZRf1AcYxhCf8=
X-Received: by 2002:a05:622a:1b91:b0:447:e3e3:77c1 with SMTP id
 d75a77b69052e-4550859549emr27021cf.29.1724349479217; Thu, 22 Aug 2024
 10:57:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <874j7ccxtz.fsf@trenco.lwn.net>
In-Reply-To: <874j7ccxtz.fsf@trenco.lwn.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 22 Aug 2024 10:57:21 -0700
Message-ID: <CABCJKud=YO=fxF_tmX1N2ec66Rzqh8RsaQu0qrbC5WB529wgWg@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
To: Jonathan Corbet <corbet@lwn.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Thu, Aug 22, 2024 at 9:43=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Sami Tolvanen <samitolvanen@google.com> writes:
>
> > The first 16 patches of this series add a small tool for computing
> > symbol versions from DWARF, called gendwarfksyms. When passed a
> > list of exported symbols and an object file, the tool generates
> > an expanded type string for each symbol, and computes symbol CRCs
> > similarly to genksyms.
>
> Potentially silly question but: how similarly?  Specifically, do the two
> tools generate the same CRCs for the same symbols?  It seems that might
> be important for users transitioning to the new DWARF world order.

Reconstructing the source-based type strings genksyms uses from DWARF
wouldn't really be feasible, so the CRCs will be different. The
similar part is just that we build a human-readable string from the
debugging information and compute a CRC from it. If anyone is
interested in switching to gendwarfksyms, they'll have to rebuild all
their modules too.

Sami
