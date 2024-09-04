Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2741384DE0
	for <asahi@lists.linux.dev>; Wed,  4 Sep 2024 20:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725483120; cv=none; b=hqlvD+ZDL/ZAikFZ04WDRvRT9pWUfqmv1Buqx9lgLC258Y/i/HWvHk6duFVwoDuuyqE7MCQfR9kVPfM3UzccTxLOUVAnqlbLIf3qbaMCN61DjGMcl8dismGTheLl5PJZfz75m2H3lyYDmI3/wvKp+0Yo2A7NoroJ/emPA+IGg4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725483120; c=relaxed/simple;
	bh=VEu8lwhgjRv28++UfFlI7Q85Fll0aPf4HEKrWKfuyIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHUdxTu1qx2LMH5so+KZYUvN4HZUvrrRTMjB2LXQ7MkAgE7DaZnatTr9N25LUJkam03LyYzCmnmMmX+ZP2hSBy9dqub5iziDvzXX0sgWq1o6plk7bxO+HAg7hpcRedJDbhd4wTHVTBrsSAPCywvTToU9rE/GTrPvmWBu/I+Ng2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rzgvcjjl; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rzgvcjjl"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-456871a4d8fso31071cf.0
        for <asahi@lists.linux.dev>; Wed, 04 Sep 2024 13:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725483118; x=1726087918; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHG7bQnsGZf2B0kptsJNBpltOovSM7V6WQ5dy2HJTmw=;
        b=Rzgvcjjl6s+h/BRTJ28SL6SAuCjXaZe0QwfEFefNixsfel5rCeYEo9HPngAXojQf4I
         UdowlQXdjZa6qQp8/870s9FsZk3DkX/0fTGnmtjJgh2VG7A7O+imMpDANWxdT5SUljek
         7M+jYrdVfpXZqWAP72WKp4BSCURzy4bZHyYBm1xd//Nu6qgSmhTXGGW7/nBCHfR/52rk
         Q4F3XPI5Rswtprser08H7ywEd/ZWmmIdGoMyo7BD6T3ZbrN9MTP0AHfb6w5kNeS18Sia
         Wep4ii3wViLYvlycW7fdAg8AB8NED7iLoU+rY2aaxPVUzk/H/PQ6oD4CNg/H+6j48aN5
         5uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725483118; x=1726087918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHG7bQnsGZf2B0kptsJNBpltOovSM7V6WQ5dy2HJTmw=;
        b=Qp8Y4Nnw8Otk5kwO6iljSQief9HQ24b3PgCuj1ssZCcUE3rlyn5pyDsYVTN7TknDHZ
         vpAFGmjKpnumQDP4Jee5i1U4CAEz+wlBIMXAvjyA16Uw6VCoH/2ZmEde2erw2+b0gdDg
         im+Nof1HFTVhHM/2aheAF4rnIOAcZgMACTlqWPHleI0POCgxjdWcUkVFWaR9r0xbLFFN
         1ne+mXRbCa5zzgIOmFSCuWIcOvtkL8iDROPKZhpC9SVxPI5PN2BSKLQguP5qVRO7i/0z
         yyxKk61HhpPYjJFF3y6+z2KbtHk+wa7IoT2trZrVpEYVQtB/zJOm+lcfbk8Ft1f41ijY
         SVxg==
X-Forwarded-Encrypted: i=1; AJvYcCUIzZ4el6Dwn48VqryjjqKIWdh9GKcwunxgUyE7KCRNgnF3QwetLcQfspSOPSNcGToAs9hMPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuOjYSxFrNHVa4i5LlZX2NfgNMiOs2GPu25zRdXM7gw3Yb6YWf
	otN6PigobCYsxmlZwnKhd/tUrw/aCTaohiWncbqGkc0UjWuW9+HTUFtEilPfp39Ek6jaoB1sC03
	0MI7TIRIQixVza2uHzdXiD9+FHS15jHi7vuBG
X-Google-Smtp-Source: AGHT+IEPmGqrm6+korttValUScEVXntGBxadK6A54rTJrxJ0IKgJZvo9hatZFvSKLsYoMlB9sNpfgYUET/vFucdBRiQ=
X-Received: by 2002:ac8:57cc:0:b0:456:7f71:ca78 with SMTP id
 d75a77b69052e-45801deb0fbmr961551cf.4.1725483117896; Wed, 04 Sep 2024
 13:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-23-samitolvanen@google.com> <CAK7LNAR4BEpehbYtQP3fw1Gt60EmSpzTEj8BijWKNCAi41fyPA@mail.gmail.com>
In-Reply-To: <CAK7LNAR4BEpehbYtQP3fw1Gt60EmSpzTEj8BijWKNCAi41fyPA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 4 Sep 2024 20:51:21 +0000
Message-ID: <CABCJKuf140CSbNm_9D1NGeMuRnZiGytnV8fawnwsWwhvGpYpLg@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] gendwarfksyms: Add symbol list handling
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

On Sun, Sep 1, 2024 at 11:00=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> >  /*
> > - * Symbol processing
> > + * Exported symbol processing
> >   */
> >  static int process_subprogram(struct state *state, Dwarf_Die *die)
> >  {
>
>
> I also tend to regard this kind comment line change as a noise.
>
>
>
> I think you can squash 02/19 into 01/19 because
> this tool does not do anything useful at this point.

Yes, that makes sense. I'll squash these in v3.

Sami
