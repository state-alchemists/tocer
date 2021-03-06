set -e
echo "Clean up"
rm -Rf testDir

echo "Prepare"
mkdir -p testDir
cp test-template.md testDir/README.md
cd testDir
python ../tocer.py README.md

echo "Testing"
for EXPECTED_FILE in fermions/README.md fermions/leptons/README.md fermions/leptons/electron.md fermions/leptons/electron-neutrino.md fermions/quarks/README.md fermions/quarks/bottom.md
do
    if [ -f "${EXPECTED_FILE}" ]
    then
        echo "[โ PASS] ${EXPECTED_FILE} exists"
    else
        echo "[โ FAIL] ${EXPECTED_FILE} doesn't exist"
    fi
done

if [ ! -z "$(cat README.md | grep "* \[๐งถ Fermions](fermions/README\.md)")" ]
then
    echo "[โ PASS] Fermions link valid"
else
    echo "[โ FAIL] Fermions link invalid"
fi

if [ ! -z "$(cat README.md | grep "* \[Leptons](fermions/leptons/README\.md)")" ]
then
    echo "[โ PASS] leptons link valid"
else
    echo "[โ FAIL] leptons link invalid"
fi

if [ ! -z "$(cat README.md | grep "* \[Electron](fermions/leptons/electron\.md)")" ]
then
    echo "[โ PASS] electron link valid"
else
    echo "[โ FAIL] electron link invalid"
fi

if [ ! -z "$(cat README.md | grep "* \[Electron Neutrino](fermions/leptons/electron-neutrino\.md)")" ]
then
    echo "[โ PASS] electron neutrino link valid"
else
    echo "[โ FAIL] electron neutrino link invalid"
fi

if [ ! -z "$(cat README.md | grep "* \[Quarks](fermions/quarks/README\.md)")" ]
then
    echo "[โ PASS] quarks link valid"
else
    echo "[โ FAIL] quarks link invalid"
fi

if [ ! -z "$(cat README.md | grep "* \[Bottom](fermions/quarks/bottom\.md)")" ]
then
    echo "[โ PASS] bottom link valid"
else
    echo "[โ FAIL] bottom link invalid"
fi

if [ ! -z "$(cat README.md | grep "* \[a](a/README\.md)")" ]
then
    echo "[โ PASS] a link valid"
else
    echo "[โ FAIL] a link invalid"
fi

if [ ! -z "$(cat README.md | grep "* \[a.1](a/a-1/README\.md)")" ]
then
    echo "[โ PASS] a.1 link valid"
else
    echo "[โ FAIL] a.1 link invalid"
fi

if [ ! -z "$(cat README.md | grep "* \[a.1.1](a/a-1/a-1-1/README\.md)")" ]
then
    echo "[โ PASS] a.1.1 link valid"
else
    echo "[โ FAIL] a.1.1 link invalid"
fi

if [ ! -z "$(cat README.md | grep "* \[a.1.1.1](a/a-1/a-1-1/a-1-1-1\.md)")" ]
then
    echo "[โ PASS] a.1.1 link valid"
else
    echo "[โ FAIL] a.1.1 link invalid"
fi

if [ ! -z "$(cat README.md | grep "* \[a.1.2](a/a-1/a-1-2\.md)")" ]
then
    echo "[โ PASS] a.1.2 link valid"
else
    echo "[โ FAIL] a.1.2 link invalid"
fi

if [ ! -z "$(cat README.md | grep "* \[a.2](a/a-2/README\.md)")" ]
then
    echo "[โ PASS] a.2 link valid"
else
    echo "[โ FAIL] a.2 link invalid"
fi

if [ ! -z "$(cat README.md | grep "* \[a.2.1](a/a-2/a-2-1\.md)")" ]
then
    echo "[โ PASS] a.2.1 link valid"
else
    echo "[โ FAIL] a.2.1 link invalid"
fi


if [ ! -z "$(cat README.md | grep "\โ\โ\โ README\.md")" ]
then
    echo "[โ PASS] code executed"
else
    echo "[โ FAIL] code not executed"
fi
