Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCDC768FD
	for <asahi@lists.linux.dev>; Mon, 26 Aug 2024 18:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724698107; cv=none; b=a8w04SV5CFbZoFnzVtAqi9cDo90h0jKfsun1ibSj7o+kShzra7JSCtUzxQ7GGKnSJMG60/dg5BidwGbJbvNZKUA1y/eG6cWmq5z9NutPXJqIX+ZHaNSc0cq+zBuqkYq136zq3MEZVeElHuvEw9eZPj8oM+bEVDm6cWEGw/q24rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724698107; c=relaxed/simple;
	bh=4KHZDbHVvybJrrJRf2shJpi55zrBot//rPnU6diq1ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mb5Prc2O+oxO737f3dZ3FXaXSA9sK8AAfTxQK2mghsMAxNex2pIsGj/HxixuuQjk+3L/FKKMOLkwE9dLYyTG1VJz24OgCNbW91A+pNdrXm8IVA2RyJ4Qazyxk9612/udUV+0BZ/1YXfa1kA/qBzmo8Lv5vqBwyXP5mAo8V4752Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vhhscJ6C; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vhhscJ6C"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-45029af1408so46981cf.1
        for <asahi@lists.linux.dev>; Mon, 26 Aug 2024 11:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724698103; x=1725302903; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxRNBk+sXtrzsGJLBtG2+5zrhZWxSczLlI1FbuSfc9s=;
        b=vhhscJ6CmqrHF7gZSFXfGWq84g8qa1u7OSa9sZ6asNNK3muXGOtuCx8vJFWGXgfFPt
         elXoyYOdeun67awdlRAblqiG2WVVFqrM45yw5UihYxhayiY6U0ZdvrFmmHrnXv/tvnLn
         4Q/I8Zn26j2MWnQivSI/2zjavQeMF8P5oryv8Qy6EPjCi4yGVD1vJ8XNBjB2qQR47FYw
         ThNFAhqrKPKPzmKqw6gqx+LxCdjmhQZkzC7ZAVik2ILwRWzQvT3+QlaPBqkdypHUnKDF
         ED2gArJQCoaPzP4sbjEEVX+GitHBBGvBA/UKNg60W0YCpNgmUcftP+53GhSs3kPfpUND
         ayQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724698103; x=1725302903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxRNBk+sXtrzsGJLBtG2+5zrhZWxSczLlI1FbuSfc9s=;
        b=ADd0QSlgGncPUzCpuKWTna5DRy5Rkgx9hTPjKt2DxOraqQWJM6ThD38xl3KDcCJCSt
         d2bSV/2jHfXRpsLcE7JXrLNOTw2fWaZBxWHMU4T1XliO9utBDCvwyiKEcHs0dVbxr5kL
         S3sOoW0rtKlDCp0tEuhlSDZqyrNPlYbFogLApRdVvSarHUeDhkiyLlv+lEu4JQOQ3SAf
         7pqZpk24PEA0kRzRwBvXZEwh005PnXtB+QiUTQ+a8RS433OYrKnlttRa5f/XNGtbWZRQ
         x7IrtW2PvXwKtJCFbbw0NBEq6yPtRP+YgxqhPP2UHV+vGtHcAQF5GW9SXahOxVvFka5M
         19VQ==
X-Forwarded-Encrypted: i=1; AJvYcCURvRI9Lh2BiYkcEgz1BtdfLxqZnxxZxaZrkdpV93ERjDjRzG6NJL1mS8YOW3UzYVrFlN/3Fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBV3WyVNjhaty6oygweXzzo8OBc2ldVXgiPkrFtAV4NqSMvLxZ
	NsT0hy+JD9gGjEgoOWsx+k++H7o7yr898rtoXOcSVf/MUw/okpDtMGdmni1neu7jiC9vTifpoCM
	NZ3LC8DMv1AEDPJvRhes+0esduR2VtexEEYwu
X-Google-Smtp-Source: AGHT+IGkpKvYNDu7BE8rDmRjRl0GYKrGuST0mK1D3Ze+fn0oUWdVXS11q+PYcRrRvwRXWWrWWCo3LPcNpB2zFsfmlAc=
X-Received: by 2002:a05:622a:130b:b0:447:d7fd:63f with SMTP id
 d75a77b69052e-45661e2b315mr247951cf.19.1724698103340; Mon, 26 Aug 2024
 11:48:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com> <71505c05-b651-4740-b14a-a53084a16a61@suse.com>
In-Reply-To: <71505c05-b651-4740-b14a-a53084a16a61@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 26 Aug 2024 11:47:44 -0700
Message-ID: <CABCJKufveknkc_ribOBamC_MXRGounFkYBeRkKhppPSHijxtZg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Mon, Aug 26, 2024 at 10:42=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> w=
rote:
>
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > +static int parse_options(int argc, const char **argv)
> > +{
> > +     for (int i =3D 1; i < argc; i++) {
> > +             bool flag =3D false;
> > +
> > +             for (int j =3D 0; j < ARRAY_SIZE(options); j++) {
> > +                     if (strcmp(argv[i], options[j].arg))
> > +                             continue;
> > +
> > +                     *options[j].flag =3D true;
> > +
> > +                     if (options[j].param) {
> > +                             if (++i >=3D argc) {
> > +                                     error("%s needs an argument",
> > +                                           options[j].arg);
> > +                                     return -1;
> > +                             }
> > +
> > +                             *options[j].param =3D argv[i];
> > +                     }
> > +
> > +                     flag =3D true;
> > +                     break;
> > +             }
> > +
> > +             if (!flag)
> > +                     object_files[object_count++] =3D argv[i];
>
> I would rather add a check that this doesn't produce an out-of-bounds
> access.

True, this could overflow object_files with a sufficient number of
arguments. I'll add a check.

> > [...]
> > +int main(int argc, const char **argv)
> > +{
> > +     unsigned int n;
> > +
> > +     if (parse_options(argc, argv) < 0)
> > +             return usage();
> > +
> > +     for (n =3D 0; n < object_count; n++) {
> > +             Dwfl *dwfl;
> > +             int fd;
> > +
> > +             fd =3D open(object_files[n], O_RDONLY);
> > +             if (fd =3D=3D -1) {
> > +                     error("open failed for '%s': %s", object_files[n]=
,
> > +                           strerror(errno));
> > +                     return -1;
> > +             }
> > +
> > +             dwfl =3D dwfl_begin(&callbacks);
> > +             if (!dwfl) {
> > +                     error("dwfl_begin failed for '%s': %s", object_fi=
les[n],
> > +                           dwarf_errmsg(-1));
> > +                     return -1;
> > +             }
> > +
> > +             if (!dwfl_report_offline(dwfl, object_files[n], object_fi=
les[n],
> > +                                      fd)) {
> > +                     error("dwfl_report_offline failed for '%s': %s",
> > +                           object_files[n], dwarf_errmsg(-1));
> > +                     return -1;
> > +             }
> > +
> > +             dwfl_report_end(dwfl, NULL, NULL);
> > +
> > +             if (dwfl_getmodules(dwfl, &process_modules, NULL, 0)) {
> > +                     error("dwfl_getmodules failed for '%s'",
> > +                           object_files[n]);
> > +                     return -1;
> > +             }
>
> I see that libdwfl has also directly function dwfl_nextcu(). Would it
> make sense to use it to simplify the code?

How do you propose using the function? This loop goes through multiple
input files, should we need them, and we iterate through all the CUs
in process_modules.

> > +
> > +             dwfl_end(dwfl);
> > +             close(fd);
>
> Isn't fd consumed by dwfl_report_offline() on success? I'm seeing EBADF
> from this close() call.

Good catch! I'll drop this in v3.

Sami
