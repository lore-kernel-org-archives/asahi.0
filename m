Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A5D53A7
	for <asahi@lists.linux.dev>; Thu, 31 Oct 2024 01:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730339849; cv=none; b=er2LlLAzZYCaFGJrhj5in0e/8X53hqXKGS/wq3ef0u2oPDSDDKaO7uEC19Dxx+DuVWfi53dWcMUIK62f1yJkbCy4+Twr++xziq+OUupujfGOxr2gvsn/8TVEuRspRjk98JFuuTi0YsG5+jP7sOpkdBwnFdShzm3moTWPFl98cg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730339849; c=relaxed/simple;
	bh=0nGzX7cvoxaUK7ySnJHlrYRZOHqiEXeRUQ9nAXlxSN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSeRNs8TuQRkDBxcl17gEEaW4RDZF8/JLTGdLNnMEiriCrjhKQtPMIC435fNM1A45xUO+2HFSlmok0tlgNW6b8IhKfX+BBS9miLScslExcbTeVf37CU5m03aCn29Q3TVjzMGFFVI1tNp8qSlBW/MYgHnUOEaNHsf0CxTUbHTvjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1u8NaOa; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1u8NaOa"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so14833501fa.0
        for <asahi@lists.linux.dev>; Wed, 30 Oct 2024 18:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730339846; x=1730944646; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0nGzX7cvoxaUK7ySnJHlrYRZOHqiEXeRUQ9nAXlxSN0=;
        b=d1u8NaOaegkPdFH4BSjKXiS9kQBAPkR915qfbXSklM12rm2J+uQ+7at6J1/Z+P3EyR
         9xPozrwx1Z1WWpLAs2RySN+PwWpeTp71pQXr8xsU7ufWh0YQUbcJg5DjtkeI3ILARD56
         9L4Si9ECXd+Xw7OD1/KfMyxT7sYBcaDlKcdasYtFdWXbFVZ/NXw3puYN4t6bOHTshbzH
         jqMZZSJOOPUCgvBDQJXrVKTNFOKqN070Qja4hk3r0pZp0bHXb8MykZaM71qiJIkKZva8
         YqmWXzftkFti7m6oEo4HIw3JKoGDMlwOvopeG/7VbBZkG1yA3Ua7RZ56ZxiRaZc5o/d/
         V9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730339846; x=1730944646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0nGzX7cvoxaUK7ySnJHlrYRZOHqiEXeRUQ9nAXlxSN0=;
        b=fD8Kz/rwbt+iLKeFoK+u4eWz1zjflrjdVGzkCTcs86DOa3TK5aB6MFkzGsnLF/kUfq
         Buh16aO7GtIh6nItfOO5+WW+lFPcFrHbiTn9qHG0vAD5UHpH2yMj1UDS421FTLH8CItF
         +9zY/Lg3lFkLbgBUPN3SIS4fSzlqKCamuxkmTFhBJ/ovLlNeWr2Ofm08Nx5ynURiMOve
         yAvfCASwxsF/u/ne+WRh+6IGHNg22Ucirr7/HZahVskihpDC2iLG4LWSmKVX/sON38Dd
         ptU4YL3ZOGTDl8PwVV16x0e7YH6iQI3huuNLOnKt0rjsd5SJIvbYqnadl7cYsXhbl2vy
         S4Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVvzrHpEj2TaO26NGjjteA7WPCnQQqaaloL2GXFcWpCRYJ8ZE2pd2xfhoOFF2nvJe+f9CiL/w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy20ecMrWyZMTjvD4wYgyo7qunm1l1289s4KVT47l88m0DkxZfs
	UdfQqkg9Z/35avJ5ITJrG+IJrSn6T2Jh/L5SH/7OBjdFvU9IsOMOnniVqLOl9Icn3cPMtDwzjbB
	jWrJfea2EbriXBW/LRFfiWP3elLs=
X-Google-Smtp-Source: AGHT+IGpPkVwwPSIxo8IYBpRNuyJN+Nwt4EGdkKqDyMJU+J6uO8LH84FTUGSBjjnWzI6pB8h3tfIYXFF2CGMvBU+BYY=
X-Received: by 2002:a05:6512:39c8:b0:539:f23b:59cc with SMTP id
 2adb3069b0e04-53c7bc36922mr218912e87.22.1730339845561; Wed, 30 Oct 2024
 18:57:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <CA+icZUWTdgM7HQrnR_NzgZZQE3aXXk+tAqD3srNd1Eyjr5d7EA@mail.gmail.com> <CABCJKuepGSFcQa0F5iO4aa4V2UbhuKO+tyfhB3_ODaTGs3sM5Q@mail.gmail.com>
In-Reply-To: <CABCJKuepGSFcQa0F5iO4aa4V2UbhuKO+tyfhB3_ODaTGs3sM5Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 31 Oct 2024 02:56:49 +0100
Message-ID: <CA+icZUXdMGk5uTZ_as0UOw-zmZuxTXc6J3U2_He00UOca86Gig@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 10:14=E2=80=AFPM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> Hi Sedat,
>
> On Wed, Oct 30, 2024 at 2:00=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.co=
m> wrote:
> >
> > Hi Sami,
> >
> > perfect timing: Nathan uploaded SLIM LLVM toolchain v19.1.3
> >
> > KBUILD_GENDWARFKSYMS_STABLE is to be set manually?
> > What value is recommended?
>
> The usage is similar to KBUILD_SYMTYPES, you can just set
> KBUILD_GENDWARFKSYMS_STABLE=3D1 to use --stable when calculating
> versions. However, it's not normally necessary to set this flag at all
> when building your own kernel, it's mostly for distributions.
>
> Sami

OK, thanks.

# cat /proc/version
Linux version 6.12.0-rc5-1-amd64-clang19-kcfi
(sedat.dilek@gmail.com@iniza) (ClangBuiltLinux clang version 19.1.3
(https://github.com/llvm/llvm-project.git
ab51eccf88f5321e7c60591c5546b254b6afab99), ClangBuiltLinux LLD 19.1.3
(https://github.com/llvm/llvm-project.git
ab51eccf88f5321e7c60591c5546b254b6afab99)) #1~trixie+dileks SMP
PREEMPT_DYNAMIC 2024-10-30

Tested-by: Sedat Dilek <sedat,dilek@gmail.com> # LLVM/Clang v19.1.3 on x86-=
64

Best regards,
-Sedat-
